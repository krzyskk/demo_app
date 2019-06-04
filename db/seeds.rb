5.times do |i|
  user = User.find_or_create_by(email: "user#{i}@example.com") do |u|
    u.password = "password#{i}"
  end
end