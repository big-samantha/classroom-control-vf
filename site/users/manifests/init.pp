
class users {
  user { 'fundamentals':
        ensure =>present,
  }

}

class { 'users': }
