# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create( email: 'stefano@ex.com', password: 'abcd1234' )
User.create( email: 'marc@ex.com', password: 'abcd1234' )
User.create( email: 'christiaan@ex.com', password: 'abcd1234' )
User.create( email: 'angela@ex.com', password: 'abcd1234' )
User.create( email: 'timmo@ex.com', password: 'abcd1234' )
User.create( email: 'douwe@ex.com', password: 'abcd1234' )
