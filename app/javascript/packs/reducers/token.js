import * as types from './../../packs/constants/token'

export default function tokenReducer(state = {}, action) {
  switch (action.type) {
    case types.FETCH_TOKEN_SUCCESS:
      return {
        token: action.token
      }
    case types.FETCH_TOKEN_FAILURE:
      return {
        error: action.error
      }
    default:
      return state
  }
}
