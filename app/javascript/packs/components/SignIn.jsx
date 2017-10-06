import React from 'react'
import TextField from 'material-ui/TextField'
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card'
import FlatButton from 'material-ui/FlatButton'

export default class SignIn extends React.Component {
  componentDidUpdate() {
    const {  user, history } = this.props
    if (user) {
      history.push('/')
    }
  }

  signUp() {
    const { history } = this.props
    history.push('/signup')
  }

  signIn() {
    const { signIn } = this.props
    const email = document.getElementById('email').value
    const password = document.getElementById('password').value
    signIn(email, password)
  }

  render() {
    const { tokenError, authError } = this.props
    const error = tokenError || authError
    return <div className="content">
      <Card>
        <CardHeader
          title="Sign In"
          subtitle={error ? 'failure' : ''}
        />
        <CardText>
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
        <FlatButton label="Sign In" onClick={this.signIn.bind(this)} />
        <FlatButton label="Sign Up" onClick={this.signUp.bind(this)}/>
      </CardActions>
    </Card>
  </div>
  }
}
