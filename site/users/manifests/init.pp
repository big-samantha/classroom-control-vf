
class users {
  include  users::admins
  
  user { 'fundamentals':
        ensure =>present,
  }

}
