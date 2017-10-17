users = [
  { email: 'francis.underwood@example.com', username: 'francis' },
  { email: 'zoe.barnes@example.com', username: 'zoe' },
  { email: 'dough.stamper@example.com', username: 'doug' }
]

ROM.env.relations[:users].multi_insert(users)
