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

jobs = ["apple","pear","grape","peach","melon","sesame_leaf","pumpkin","corn"]
answers = ["apple","pear","grape","peach","melon","sesame_leaf","pumpkin","corn"]
notices = ["apple","pear","grape","peach","melon","sesame_leaf","pumpkin","corn"]
questions = ["apple","pear","grape","peach","melon","sesame_leaf","pumpkin","corn"]
reviews = ["apple","pear","grape","peach","melon","sesame_leaf","pumpkin","corn"]
users = ["apple","pear","grape","peach","melon","sesame_leaf","pumpkin","corn"]
jobs.each do |job|
  Job.create(title: job)
  puts Job.last.title
end
answers.each do |answer|
  Answer.create(title: answer)
  puts Answer.last.title
end
notices.each do |notice|
  Notice.create(title: notice)
  puts Notice.last.title
end
questions.each do |question|
  Question.create(title: question)
  puts Question.last.title
end
reviews.each do |review|
  Review.create(title: review)
  puts Review.last.title
end
users.each do |user|
  User.create(email: user+"@gmail.com", password:"123123123")
  puts User.last.email
end