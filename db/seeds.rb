# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new({name: 'admin' , role: 1 , email: 'admin@admin.com', password: 'starwars15'} )
admin.save

john = User.new({name: 'john' , role: 0 , email: 'jkyony@gmail.com' , password: 'johnte12'})
john.save