export default class Config {
  static url() {
    const devHost = 'http://localhost:3000';

    if (process.env.NODE_ENV === 'production') {
      return prodHost
    } else {
      return devHost
    }
  }
}
