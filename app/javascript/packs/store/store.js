import { createStore, applyMiddleware, combineReducers } from 'redux'
import thunk from 'redux-thunk'
import logger from 'redux-logger'
import { routerReducer, routerMiddleware } from 'react-router-redux'
import token from './../reducers/token'
import auth from './../reducers/auth'
import users from './../reducers/users'

const configureStore = history => createStore(
  combineReducers({
    token,
    auth,
    users,
    routing: routerReducer
  }),
  applyMiddleware(routerMiddleware(history), thunk, logger)
)

export default configureStore
