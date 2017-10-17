users = ROM.env.relations[:users].to_a
posts = [
  # zoe
  { content: 'Lorem ipsum dolor sit amet.', title: 'Article created by zoe', user_id: users.find { |a| a[:username] == 'zoe' }[:id] },
  { content: 'Donec pulvinar, lorem nec lobortis eleifend', title: 'Article2 created by zoe', user_id: users.find { |a| a[:username] == 'zoe' }[:id] },
  # francis
  { content: 'Lorem ipsum dolor sit amet.', title: 'Article created by francis', user_id: users.find { |a| a[:username] == 'francis' }[:id] },
  { content: 'Donec pulvinar, lorem nec lobortis eleifend', title: 'Article2 created by francis', user_id: users.find { |a| a[:username] == 'francis' }[:id] },
  # doug
  { content: 'Lorem ipsum dolor sit amet.', title: 'Article created by doug', user_id: users.find { |a| a[:username] == 'doug' }[:id] },
  { content: 'Donec pulvinar, lorem nec lobortis eleifend', title: 'Article2 created by doug', user_id: users.find { |a| a[:username] == 'doug' }[:id] }
]

ROM.env.relations[:posts].multi_insert(posts)
