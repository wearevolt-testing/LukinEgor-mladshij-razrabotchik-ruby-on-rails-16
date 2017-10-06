import fetch from 'isomorphic-fetch'
import Config from './../utils/config';
import * as types from './../constants/token';

function fetchTokenRequest() {
  return {
    type: types.FETCH_TOKEN_REQUEST
  }
}

function fetchTokenSuccess(token) {
  return {
    type: types.FETCH_TOKEN_SUCCESS,
    token
  }
}

function fetchTokenFailure(error) {
  return {
    type: types.FETCH_TOKEN_FAILURE,
    error
  }
}

function makeRequest(email, password) {
  return fetch(`${Config.url()}/api/v1/user_token`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:  JSON.stringify({auth: { email: email, password: password }})
    })
    .then(response => response.json())
}

export function fetchToken(email, password) {
  return dispatch => {
    dispatch(fetchTokenRequest())
    return makeRequest(email, password)
      .then(json => {
        const token = json['jwt'];
        dispatch(fetchTokenSuccess(token))
      })
      .catch(error => {
        dispatch(fetchTokenFailure(error))
      })
  }
}
