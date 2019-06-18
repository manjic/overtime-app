100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content")
end

puts "100 post have been created"
