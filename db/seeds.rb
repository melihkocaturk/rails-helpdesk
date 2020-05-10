# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Recreate Database:
#
#   rails db:purge db:create db:migrate db:seed
#

User.create(
  email: "user@user.com",
  password: "password",
  role: "user"
)

User.create(
  email: "agent@agent.com",
  password: "password",
  role: "agent"
)

User.create(
  email: "admin@admin.com",
  password: "password",
  role: "admin"
)

User.create(
  email: "superuser@superuser.com",
  password: "password",
  role: "superuser"
)

Category.create(name: "Your Orders")
Category.create(name: "Returns & Refunds")
Category.create(name: "Digital Services and Device Support")
Category.create(name: "Payments & Gift Cards")
Category.create(name: "Your Account")
