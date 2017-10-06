import React from 'react';
import TextField from 'material-ui/TextField';
import {Card, CardActions, CardHeader, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton';

export default class SignUp extends React.Component {
  componentDidUpdate() {
    const {  user, history } = this.props
    if (user) {
      history.push('/')
    }
  }

  signIn() {
    const { history } = this.props
    history.push('/signin')
  }

  signUp() {
    const { signUp } = this.props
    const nickname = document.getElementById('nickname').value
    const email = document.getElementById('email').value
    const password = document.getElementById('password').value
    signUp(nickname, email, password)
  }

  status() {
    const { errors } = this.props
    return errors ? Object.values(errors).join(', ') : null
  }

  render() {
    const { status } = this.props
    return <div className="content">
      <Card>
        <CardHeader
          title="Sign Up"
          subtitle={this.status()}
        />
        <CardText>
          <TextField
            hintText="Nickname"
            floatingLabelText="Nickname"
            id="nickname"
          /><br/>
          <TextField
            hintText="Email"
            floatingLabelText="Email"
            id="email"
          /><br/>
          <TextField
            hintText="Password"
            floatingLabelText="Password"
            type="password"
            id="password"
          /><br/>
        </CardText>
        <CardActions>
          <FlatButton label="Sign Up" onClick={this.signUp.bind(this)} />
          <FlatButton label="Sign In" onClick={this.signIn.bind(this)} />
        </CardActions>
      </Card>
    </div>
  }
}
