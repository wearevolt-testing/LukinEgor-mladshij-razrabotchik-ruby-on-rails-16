import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import SignUpComponent from './../components/SignUp'
import * as signUpActions from './../actions/signUp'

@connect(state => ({
  user: state.auth.user,
  status: state.users.createdUserStatus,
  serverErrors: state.users.serverErrors,
  networkErrors: state.users.networkErrors
}))

export default class SignUp extends React.Component {
  render() {
    const { user, status, serverErrors, networkErrors,
      history, dispatch } = this.props
    const actions = bindActionCreators(signUpActions, dispatch)
    return <div>
      <SignUpComponent
        user={user}
        status={status}
        signUp={actions.signUp}
        history={this.props.history}
        errors={serverErrors || networkErrors}
      />
    </div>
  }
}
