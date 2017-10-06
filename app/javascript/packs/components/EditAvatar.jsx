import React from 'react'
import TextField from 'material-ui/TextField'
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card'
import FlatButton from 'material-ui/FlatButton'

export default class EditUser extends React.Component {
  componentWillMount() {
    const { user, history } = this.props
    if (!user) {
      history.push('/signin')
    }
  }

  update() {
    const { updateAvatar, user } = this.props
    const avatar = document.getElementById("avatar").files[0];
    updateAvatar(user.id, avatar)
  }

  status() {
    const { status, errors } = this.props
    const errorMessage = errors ? Object.values(errors).join(', ') : null
    return errorMessage || status
  }

  render() {
    const { error, user } = this.props
    return <div className="content">
      <Card>
        <CardHeader
          title="User Info"
          subtitle={this.status()}
        />
        <CardMedia>
          <img src={user ? user.avatar.preview.url : null} alt="" />
        </CardMedia>
        <CardText>
          Update avatar
          <input type="file" id="avatar" accept="image/jpeg,image/png"/>
        </CardText>
      <CardActions>
        <FlatButton label="Update" onClick={this.update.bind(this)} />
      </CardActions>
    </Card>
  </div>
  }
}
