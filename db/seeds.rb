User.destroy_all
admin = User.create!(email:'admin@farmfarmmentor.org', password:'12341234')
admin.confirm!
Role.destroy_all
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

jobs = ["사과 수확","배 수확","포도 수확","복숭아 수확","멜론 수확","깻잎 수확","호박 수확","옥수수 수확"]
answers = ["사과 수확","배 수확","포도 수확","복숭아 수확","멜론 수확","깻잎 수확","호박 수확","옥수수 수확"]
notices = ["사과 수확","배 수확","포도 수확","복숭아 수확","멜론 수확","깻잎 수확","호박 수확","옥수수 수확"]
questions = ["사과 수확","배 수확","포도 수확","복숭아 수확","멜론 수확","깻잎 수확","호박 수확","옥수수 수확"]
reviews = ["사과 수확","배 수확","포도 수확","복숭아 수확","멜론 수확","깻잎 수확","호박 수확","옥수수 수확"]
users = ["사과 수확","배 수확","포도 수확","복숭아 수확","멜론 수확","깻잎 수확","호박 수확","옥수수 수확"]
jobs.each do |job|
  Job.create(title: job)
end
answers.each do |answer|
  Answer.create(title: answer)
end
notices.each do |notice|
  Notice.create(title: notice)
end
questions.each do |question|
  Question.create(title: question)
end
reviews.each do |review|
  Review.create(title: review)
end
users.each do |user|
  User.create(name: user)
end