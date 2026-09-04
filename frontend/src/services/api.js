import axios from 'axios'

const api = axios.create({
  baseURL: '/api',
})

export const getTiposId = async () => {
  const { data } = await api.get('/tipos-id')
  return data
}

export const getPaises = async () => {
  const { data } = await api.get('/paises')
  return data
}

export const getDepartamentos = async (paisId) => {
  const { data } = await api.get(`/departamentos/${paisId}`)
  return data
}

export const getCiudades = async (deptoId) => {
  const { data } = await api.get(`/ciudades/${deptoId}`)
  return data
}

export const getMarcas = async () => {
  const { data } = await api.get('/marcas')
  return data
}

export const registrarCliente = async (payload) => {
  const { data } = await api.post('/registro', payload)
  return data
}
