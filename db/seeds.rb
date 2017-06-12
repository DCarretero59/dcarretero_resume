10.times do |blog|
  Blog.create!(
    title: Faker::Robin.quote,
    body: Faker::Lorem.paragraph
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: Faker::DragonBall.character,
    percent_utilized: Faker::Number.between(1, 10)
  )
end
puts "5 skills posts created"

9.times do |port|
  Portfolio.create!(
    title: Faker::App.name,
    subtitle: Faker::App.version,
    body: Faker::Lorem.paragraph ,
    main_image: "https://placeholdit.co//i/600x400?" ,
    thumb_image: "https://placeholdit.co//i/350x200?" 
  )
end

puts "9 portfolio items created created"