5.times do |i|
  user = User.find_or_create_by(email: "user#{i}@example.com") do |u|
    u.password = "password#{i}"
  end
end

200.times do |j|
  Message.create!(content: Faker::Lorem.famous_last_words, user_id: User.all.pluck(:id).sample)
  Message.create!(content: Faker::Lorem..most_interesting_man_in_the_world,
    user_id: User.all.pluck(:id).sample)
end