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

jobs.each do |job|
  Job.create(title: job)
  puts Job.last.title
end