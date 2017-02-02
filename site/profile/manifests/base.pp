class profile::base {
  notify { 'our hiera message':
    message => hiera('message')
  }
}
