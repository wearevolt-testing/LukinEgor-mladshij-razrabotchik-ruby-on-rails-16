import React from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import EditAvatarComponent from './../components/EditAvatar'
import * as usersActions from './../actions/users'

@connect(state => ({
  token: state.token.token,
  user: state.auth.user,
  status: state.users.updatedUserStatus,
  serverErrors: state.users.serverErrors,
  networkErrors: state.users.networkErrors
}))

export default class EditAvatar extends React.Component {
  render() {
    const { user, token, dispatch, history, status,
      serverErrors, networkErrors } = this.props
    const actions = bindActionCreators(usersActions, dispatch)
    return <div>
      <EditAvatarComponent
        history={history}
        token={token}
        user={user}
        updateAvatar={actions.updateUserAndReEntry.bind(this, token)}
        status={status}
        errors={serverErrors || networkErrors}
      />
    </div>
  }
}
