import { createUser } from './users'
import { signIn } from './signIn'

export function signUp(nickname, email, password) {
  return (dispatch, getState) => {
    return dispatch(createUser(nickname, email, password)).then(() => {
      const error = getState().users.serverErrors
      return !error ? dispatch(signIn(email, password)) : null
    })
  }
}
