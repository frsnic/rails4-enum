# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Admin', role: User.roles[:admin])
User.create(name: 'Manager', role: User.roles[:manager])
User.create(name: 'Client', role: User.roles[:client])

