import React from 'react'
import { Provider } from 'react-redux'
import createHistory from 'history/createBrowserHistory'
import { render } from 'react-dom'
import { Router, Route } from 'react-router-dom'
import { ConnectedRouter } from 'react-router-redux'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import "./application.css"
import configureStore from './store/store.js'
import SignIn from './containers/SignIn'
import SignUp from './containers/SignUp'
import EditAvatar from './containers/EditAvatar'

const history = createHistory()
const store = configureStore(history)

document.addEventListener('DOMContentLoaded', () => {
  render(
    <Provider store={store}>
      <MuiThemeProvider>
        <ConnectedRouter history={history}>
          <div>
            <Route exact path="/" component={EditAvatar}/>
            <Route path="/signin" component={SignIn}/>
            <Route path="/signup" component={SignUp}/>
          </div>
        </ConnectedRouter>
      </MuiThemeProvider>
    </Provider>,
    document.body.appendChild(document.createElement('div'))
  )
})
