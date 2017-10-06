import * as types from './../../packs/constants/users'

const initialState = {
  users: []
}

export default function usersReducer(state = initialState, action) {
  switch (action.type) {
    case types.CREATE_USER_REQUEST:
      return {
        ...state,
        createdUserStatus: 'waiting'
      }
    case types.CREATE_USER_SUCCESS:
      return {
        ...state,
        createdUserStatus: 'success',
        serverErrors: action.errors
      }
    case types.CREATE_USER_FAILURE:
      return {
        ...state,
        createdUserStatus: 'failure',
        networkErrors: action.errors
      }
    case types.UPDATE_USER_REQUEST:
      return {
        ...state,
        updatedUserStatus: 'waiting'
      }
    case types.UPDATE_USER_SUCCESS:
      return {
        ...state,
        updatedUserStatus: 'success',
        serverErrors: action.errors
      }
    case types.UPDATE_USER_FAILURE:
      return {
        ...state,
        updatedUserStatus: 'failure',
        networkErrors: action.errors
      }
    default:
      return state;
  }
}
