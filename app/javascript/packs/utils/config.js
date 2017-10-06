export default class Config {
  static url() {
    const devHost = 'http://localhost:3000';
    const prodHost = 'https://wearevolt-testing.herokuapp.com'

    if (process.env.NODE_ENV === 'production') {
      return prodHost
    } else {
      return devHost
    }
  }
}
