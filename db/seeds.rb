# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role = Role.create([{name:'admin'},{name:'superadmin'},{name:'user'}])
adminRole=Role.find_by(name:"admin")
superAdminRole=Role.find_by(name:"superadmin")
admin = adminRole.users.create([{email:"niraj93500@gmail.com",name:"admin",password:"1234567",phone_number:"6204907619",paid_videos_validity:Date.today+3650}])
superAdmin = superAdminRole.users.create([{email:"pathfinderkailashpuri@gmail.com",name:"superadmin",password:"1234567",phone_number:"9097991704",paid_videos_validity:Date.today+3650}])


