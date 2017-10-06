import { fetchToken } from './token'
import { auth } from './auth'

export function signIn(email, password) {
  return (dispatch, getState) => {
    return dispatch(fetchToken(email, password)).then(() => {
      const token = getState().token.token
      return dispatch(auth(token))
    })
  }
}
