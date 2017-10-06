import fetch from 'isomorphic-fetch'
import Config from './../utils/config';
import * as types from './../constants/auth';

function authRequest() {
  return {
    type: types.AUTH_REQUEST
  }
}

function authSuccess(user) {
  return {
    type: types.AUTH_SUCCESS,
    user
  }
}

function authFailure(error) {
  return {
    type: types.AUTH_FAILURE,
    error
  }
}

export function auth(token) {
  return dispatch => {
    dispatch(authRequest())
    return fetch(`${Config.url()}/api/v1/users/auth`,
      {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${token}`
        }
      })
      .then(response => response.json())
      .then(json => {
        dispatch(authSuccess(json))
      })
      .catch(error => {
        dispatch(authFailure(error))
      })
  }
}
