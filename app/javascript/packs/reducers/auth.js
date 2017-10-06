import * as types from './../../packs/constants/auth'

export default function authReducer(state = {}, action) {
  switch (action.type) {
    case types.AUTH_SUCCESS:
      return {
        user: action.user
      }
    case types.AUTH_FAILURE:
      return {
        error: action.error
      }
    default:
      return state
  }
}
