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
