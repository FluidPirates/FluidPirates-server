admin = User.create(name: "Admin", email: "admin@example.com", password: "admin")

Token.create(user: admin, expires_at: 1000.years.from_now, value: "1")
