User.destroy_all
admin = User.create!(email:'admin@farmfarmmentor.org', password:'12341234')
admin# .confirm!
Role.destroy_all
Role.create!(
  name: :mentor,
  title: "role for mentor",
  description:"mentor role"
)
Role.create!(
  name: :mentee,
  title: "role for mentee",
  description:"mentee role"
)
role = Role.create!(
  name: :admin,
  title: "role for admin",
  description:"this user can do anything"
)

role.create_rule(:system, :administrator)
role.rule_on(:system, :administrator)

puts "Admin role created"

User.first.update( role: Role.with_name(:admin) )
puts "created #{User.first.email} and that made administer"

titles = %w(사과 배 포도 복숭아 멜론 깻잎 호박 옥수수)
contents = " 내용입니다."
titles.each do |title|
  job = Job.create!(title: title, contents: title + contents)
  Answer.create!(title: title, contents: title + contents)
  Notice.create!(title: title, contents: title + contents)
  Question.create!(title: title, contents: title + contents)
  Review.create!(title: title, contents: title + contents)
  Banner.create!(title: title, contents: title + contents)
  user = User.new(email: title+"@gmail.com", password:"123123123")
  user.works << job
  user.save
  puts Job.last.title
end