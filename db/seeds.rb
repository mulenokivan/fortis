puts "Warning: some times it can take a long time to generate seeds due to robohash api overload"

3.times do |i|
  SeedGenerator::User.new
end

5.times do |i|
  SeedGenerator::Cv.new(User.find(User.pluck(:id).sample))
end