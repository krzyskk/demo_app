5.times do |i|
  user = User.find_or_create_by(email: "user#{i}@example.com") do |u|
    u.password = "password#{i}"
  end
end

200.times do |j|
  Message.create!(content: Faker::Lorem.sentence, user_id: User.all.pluck(:id).sample) 
end