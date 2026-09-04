import { useEffect, useState } from 'react'
import {
  getCiudades,
  getDepartamentos,
  getMarcas,
  getPaises,
  getTiposId,
  registrarCliente,
} from '../services/api'
import '../App.css'

const initialForm = {
  tipoIdentificacion: '',
  numeroIdentificacion: '',
  nombres: '',
  apellidos: '',
  fechaNacimiento: '',
  direccion: '',
  pais: '',
  departamento: '',
  ciudad: '',
  marca: '',
}

function RegistroCliente() {
  const [form, setForm] = useState(initialForm)
  const [tiposId, setTiposId] = useState([])
  const [paises, setPaises] = useState([])
  const [marcas, setMarcas] = useState([])
  const [departamentos, setDepartamentos] = useState([])
  const [ciudades, setCiudades] = useState([])

  const [errores, setErrores] = useState({})
  const [cargando, setCargando] = useState(false)
  const [exito, setExito] = useState('')
  const [modalError, setModalError] = useState('')
  const [tema, setTema] = useState('oscuro')

  useEffect(() => {
    const cargarCatalogos = async () => {
      try {
        const [t, p, m] = await Promise.all([getTiposId(), getPaises(), getMarcas()])
        setTiposId(t)
        setPaises(p)
        setMarcas(m)
      } catch {
        setErrores((prev) => ({
          ...prev,
          general: 'No se pudieron cargar los catálogos. Verifica que el backend esté corriendo.',
        }))
      }
    }
    cargarCatalogos()
  }, [])

  const manejarPais = async (paisId) => {
    setForm((prev) => ({ ...prev, pais: paisId, departamento: '', ciudad: '' }))
    setCiudades([])
    setErrores((prev) => {
      const copia = { ...prev }
      delete copia.pais
      delete copia.departamento
      delete copia.ciudad
      return copia
    })
    if (!paisId) {
      setDepartamentos([])
      return
    }
    try {
      setDepartamentos(await getDepartamentos(paisId))
    } catch {
      setErrores((prev) => ({ ...prev, departamento: 'No se pudieron cargar los departamentos.' }))
    }
  }

  const manejarDepartamento = async (deptoId) => {
    setForm((prev) => ({ ...prev, departamento: deptoId, ciudad: '' }))
    setErrores((prev) => {
      const copia = { ...prev }
      delete copia.departamento
      delete copia.ciudad
      return copia
    })
    if (!deptoId) {
      setCiudades([])
      return
    }
    try {
      setCiudades(await getCiudades(deptoId))
    } catch {
      setErrores((prev) => ({ ...prev, ciudad: 'No se pudieron cargar las ciudades.' }))
    }
  }

  const manejarCambio = (e) => {
    const { name, value } = e.target
    let nuevoValor = value

    if (name === 'numeroIdentificacion') {
      nuevoValor = value.replace(/\D/g, '')
    } else if (name === 'nombres' || name === 'apellidos') {
      nuevoValor = value.replace(/[^A-Za-zÁÉÍÓÚáéíóúÑñ ]/g, '')
    }

    setForm((prev) => ({ ...prev, [name]: nuevoValor }))
    setErrores((prev) => {
      const copia = { ...prev }
      delete copia[name]
      return copia
    })
  }

  const manejarEnvio = async (e) => {
    e.preventDefault()
    setCargando(true)
    setExito('')
    setErrores({})

    const tipo = tiposId.find((t) => String(t.id) === String(form.tipoIdentificacion))
    const paisSel = paises.find((p) => String(p.id) === String(form.pais))
    const deptoSel = departamentos.find((d) => String(d.id) === String(form.departamento))
    const ciudadSel = ciudades.find((c) => String(c.id) === String(form.ciudad))
    const marcaSel = marcas.find((m) => String(m.id) === String(form.marca))

    const payload = {
      tipoIdentificacion: tipo ? tipo.nombre : form.tipoIdentificacion,
      numeroIdentificacion: form.numeroIdentificacion,
      nombres: form.nombres,
      apellidos: form.apellidos,
      fechaNacimiento: form.fechaNacimiento,
      direccion: form.direccion,
      pais: paisSel ? paisSel.nombre : form.pais,
      departamento: deptoSel ? deptoSel.nombre : form.departamento,
      ciudad: ciudadSel ? ciudadSel.nombre : form.ciudad,
      marca: marcaSel ? marcaSel.nombre : form.marca,
    }

    try {
      await registrarCliente(payload)
      setExito('Cliente registrado con éxito.')
      setForm(initialForm)
      setDepartamentos([])
      setCiudades([])
    } catch (error) {
      const respuesta = error.response
      if (respuesta && respuesta.status === 400) {
        if (respuesta.data && typeof respuesta.data === 'object' && !Array.isArray(respuesta.data)) {
          setErrores(respuesta.data)
        } else {
          const textoError = typeof respuesta.data === 'string' ? respuesta.data : ''
          const esDuplicado = /unique|unicidad|violación|constraint/i.test(textoError)
          if (esDuplicado) {
            setModalError(
              'El número de identificación ya está registrado. Verifica el dato e inténtalo de nuevo.'
            )
          } else {
            setErrores({
              general:
                textoError ||
                'No se pudo procesar la solicitud. Revisa los datos e inténtalo de nuevo.',
            })
          }
        }
      } else {
        const mensaje =
          respuesta && respuesta.data && respuesta.data.error
            ? respuesta.data.error
            : 'Error de conexión con el servidor.'
        setErrores({ general: mensaje })
      }
    } finally {
      setCargando(false)
    }
  }

  const campo = (nombre) => ({ name: nombre, value: form[nombre] || '', onChange: manejarCambio })

  return (
    <div className={`contenedor tema-${tema}`}>
      <button
        type="button"
        className="boton-tema"
        onClick={() => setTema((t) => (t === 'oscuro' ? 'claro' : 'oscuro'))}
        aria-label="Cambiar tema"
      >
        {tema === 'oscuro' ? '☀️' : '🌙'}
      </button>
      <header className="cabecera">
        <h1>Programa de Fidelización de Clientes</h1>
        <p>Regístrate para recibir beneficios y promociones exclusivas.</p>
      </header>

      <form onSubmit={manejarEnvio} className="formulario" noValidate spellCheck={false}>
        {errores.general && <div className="alerta alerta-error">{errores.general}</div>}

        <section className="seccion">
          <h2>Datos de identificación</h2>
          <div className="fila">
            <div className="campo">
              <label htmlFor="nombres">Nombres</label>
              <input id="nombres" type="text" spellCheck={false} {...campo('nombres')} required />
              {errores.nombres && <span className="error">{errores.nombres}</span>}
            </div>

            <div className="campo">
              <label htmlFor="apellidos">Apellidos</label>
              <input id="apellidos" type="text" spellCheck={false} {...campo('apellidos')} required />
              {errores.apellidos && <span className="error">{errores.apellidos}</span>}
            </div>

            <div className="campo">
              <label htmlFor="fechaNacimiento">Fecha de nacimiento</label>
              <input id="fechaNacimiento" type="date" spellCheck={false} {...campo('fechaNacimiento')} required />
              {errores.fechaNacimiento && (
                <span className="error">{errores.fechaNacimiento}</span>
              )}
            </div>
          </div>

          <div className="fila">
            <div className="campo">
              <label htmlFor="tipoIdentificacion">Tipo de identificación</label>
              <select id="tipoIdentificacion" {...campo('tipoIdentificacion')} required>
                <option value="">Seleccione...</option>
                {tiposId.map((t) => (
                  <option key={t.id} value={t.id}>
                    {t.nombre}
                  </option>
                ))}
              </select>
              {errores.tipoIdentificacion && (
                <span className="error">{errores.tipoIdentificacion}</span>
              )}
            </div>

            <div className="campo">
              <label htmlFor="numeroIdentificacion">Número de identificación</label>
              <input
                id="numeroIdentificacion"
                type="text"
                spellCheck={false}
                {...campo('numeroIdentificacion')}
                required
              />
              {errores.numeroIdentificacion && (
                <span className="error">{errores.numeroIdentificacion}</span>
              )}
            </div>

            <div className="campo">
              <label htmlFor="direccion">Dirección</label>
              <input id="direccion" type="text" spellCheck={false} {...campo('direccion')} required />
              {errores.direccion && <span className="error">{errores.direccion}</span>}
            </div>
          </div>
        </section>

        <section className="seccion">
          <h2>Ubicación</h2>
          <div className="fila">
            <div className="campo">
              <label htmlFor="pais">País</label>
              <select id="pais" name="pais" value={form.pais} onChange={(e) => manejarPais(e.target.value)}>
                <option value="">Seleccione...</option>
                {paises.map((p) => (
                  <option key={p.id} value={p.id}>
                    {p.nombre}
                  </option>
                ))}
              </select>
              {errores.pais && <span className="error">{errores.pais}</span>}
            </div>

            <div className="campo">
              <label htmlFor="departamento">Departamento</label>
              <select
                id="departamento"
                name="departamento"
                value={form.departamento}
                onChange={(e) => manejarDepartamento(e.target.value)}
                disabled={!form.pais}
              >
                <option value="">Seleccione...</option>
                {departamentos.map((d) => (
                  <option key={d.id} value={d.id}>
                    {d.nombre}
                  </option>
                ))}
              </select>
              {errores.departamento && <span className="error">{errores.departamento}</span>}
            </div>

            <div className="campo">
              <label htmlFor="ciudad">Ciudad</label>
              <select id="ciudad" name="ciudad" value={form.ciudad} onChange={manejarCambio} disabled={!form.departamento}>
                <option value="">Seleccione...</option>
                {ciudades.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.nombre}
                  </option>
                ))}
              </select>
              {errores.ciudad && <span className="error">{errores.ciudad}</span>}
            </div>
          </div>
        </section>

        <section className="seccion">
          <h2>Marca de preferencia</h2>
          <div className="fila fila-centrada">
            <div className="campo">
              <label htmlFor="marca">Marca</label>
              <select id="marca" {...campo('marca')} required>
                <option value="">Seleccione...</option>
                {marcas.map((m) => (
                  <option key={m.id} value={m.id}>
                    {m.nombre}
                  </option>
                ))}
              </select>
              {errores.marca && <span className="error">{errores.marca}</span>}
            </div>
          </div>
        </section>

        <button type="submit" className="boton" disabled={cargando}>
          {cargando ? 'Registrando...' : 'Registrar cliente'}
        </button>
      </form>

      {exito && (
        <div className="modal-overlay">
          <div className={`modal tema-${tema}`}>
            <div className="modal-icono">✓</div>
            <h2>¡Registro exitoso!</h2>
            <p>{exito}</p>
            <button type="button" className="boton modal-cerrar" onClick={() => setExito('')}>
              Cerrar
            </button>
          </div>
        </div>
      )}

      {modalError && (
        <div className="modal-overlay">
          <div className={`modal tema-${tema}`}>
            <div className="modal-icono modal-icono-error">✕</div>
            <h2>No se pudo registrar</h2>
            <p>{modalError}</p>
            <button
              type="button"
              className="boton modal-cerrar"
              onClick={() => {
                setModalError('')
                setErrores({})
              }}
            >
              Cerrar
            </button>
          </div>
        </div>
      )}

      <footer className="pie">
        &copy; {new Date().getFullYear()} Jonatan Stiven Gil Pérez.
      </footer>
    </div>
  )
}

export default RegistroCliente
