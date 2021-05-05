member = User.create(
  first_name: 'Member',
  last_name: 'User',
  email: 'member@user.com',
  password: 'password123',
  password_confirmation: 'password123',
  confirmed_at: DateTime.now
)

admin = User.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@user.com',
  is_admin: true,
  password: 'password123',
  password_confirmation: 'password123',
  confirmed_at: DateTime.now
)