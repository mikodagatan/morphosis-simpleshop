member = User.create(
  first_name: 'Member',
  last_name: 'User',
  email: 'member@user.com',
  password: 'password123',
  password_confirmation: 'password123'
)

admin = User.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@user.com',
  is_admin: true,
  password: 'password123',
  password_confirmation: 'password123'
)

member.generate_jwt
admin.generate_jwt