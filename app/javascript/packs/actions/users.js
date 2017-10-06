import fetch from 'isomorphic-fetch'
import Config from './../utils/config';
import * as types from './../constants/users';
import { auth } from './../actions/auth';

function createUserRequest() {
  return {
    type: types.CREATE_USER_REQUEST
  }
}

function createUserSuccess(response) {
  return {
    type: types.CREATE_USER_SUCCESS,
    errors: response.errors
  }
}

function createUserFailure(errors) {
  return {
    type: types.CREATE_USER_FAILURE,
    errors
  }
}

function makeCreateUserRequest(nickname, email, password) {
  return fetch(`${Config.url()}/api/v1/users`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body:  JSON.stringify({ nickname, email, password })
    })
    .then(response => response.json())
}

export function createUser(nickname, email, password) {
  return dispatch => {
    dispatch(createUserRequest())
    return makeCreateUserRequest(nickname, email, password)
      .then(json => {
        dispatch(createUserSuccess(json))
      })
      .catch(error => {
        dispatch(createUserFailure(error))
      })
  }
}

function updateUserRequest() {
  return {
    type: types.UPDATE_USER_REQUEST
  }
}

function updateUserSuccess(response) {
  return {
    type: types.UPDATE_USER_SUCCESS,
    errors: response.errors
  }
}

function updateUserFailure(errors) {
  return {
    type: types.UPDATE_USER_FAILURE,
    errors
  }
}

function makeUpdateUserRequest(token, id, avatar) {
  const data = new FormData()
  data.append('avatar', avatar)
  return fetch(`${Config.url()}/api/v1/users/${id}`,
    {
      method: 'PUT',
      headers: {
        'Authorization': `Bearer ${token}`
      },
      body: data
    })
    .then(response => response.json())
}

export function updateUser(token, id, avatar) {
  return dispatch => {
    dispatch(updateUserRequest())
    return makeUpdateUserRequest(token, id, avatar)
      .then(json => {
        dispatch(updateUserSuccess(json))
      })
      .catch(error => {
        dispatch(updateUserFailure(error))
      })
  }
}

export function updateUserAndReEntry(token, id, avatar) {
  return dispatch => {
    return dispatch(updateUser(token, id, avatar)).then(() => {
      return dispatch(auth(token))
    })
  }
}
