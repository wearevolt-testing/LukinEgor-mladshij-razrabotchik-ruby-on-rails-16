import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import SignInComponent from './../components/SignIn'
import * as signInActions from './../actions/signIn'

@connect(state => ({
  token: state.token.token,
  tokenError: state.token.error,
  authError: state.auth.error,
  user: state.auth.user
}))

export default class SignIn extends React.Component {
  render() {
    const { user, token, tokenError, authError, dispatch, history } = this.props
    const actions = bindActionCreators(signInActions, dispatch)
    return <div>
      <SignInComponent
        history={history}
        token={token}
        user={user}
        signIn={actions.signIn}
        tokenError={tokenError}
        authError={authError}
      />
    </div>
  }
}
