users = ROM.env.relations[:users].to_a
comments = [
  { content: 'Great article', author_id: users.sample[:id] },
  { content: 'Thanks for this article', author_id: users.sample[:id] },
  { content: 'Terrible', author_id: users.sample[:id] },
  { content: 'Not bad', author_id: users.sample[:id] },
  { content: 'Keep writing', author_id: users.sample[:id] }
]

ROM.env.relations[:posts].each do |post|
  ROM.env.relations[:comments].multi_insert(comments.map { |rec| rec.merge(post_id: post[:id]) })
end
