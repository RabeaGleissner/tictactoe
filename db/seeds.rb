# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
u1 = User.create!(password: "password", email: "user@tic.de", description: "super enthusiastic TTT player", name: "Fred")
u2 = User.create!(password: "password", email: "user@tac.de", description: "Ex TTT world champion. I will crush you.", name: "Wilma")
u3 = User.create!(password: "password", email: "user@toe.de", description: "My first time playing TTT on my new computer.", name: "Barney")

Match.delete_all
m1 = Match.create!(player_x_id: u1.id, player_o_id: u2.id)

Move.delete_all
move1 = Move.create!(user_id: u1.id, match_id: m1.id, position: 8, value: 'x')
move2 = Move.create!(user_id: u2.id, match_id: m1.id, position: 9, value: 'o')

Match.delete_all
m2 = Match.create!(player_x_id: u1.id, player_o_id: u2.id)
m3 = Match.create!(player_x_id: u1.id, player_o_id: u2.id)


Win

move1 = Move.create(user_id: 4, match_id: m2.id, position: 7, value: 'x')
move2 = Move.create(user_id: 5, match_id: m2.id, position: 1, value: 'o')
move3 = Move.create(user_id: 4, match_id: m2.id, position: 8, value: 'x')
move4 = Move.create(user_id: 5, match_id: m2.id, position: 2, value: 'o')
move5 = Move.create(user_id: 4, match_id: m2.id, position: 9, value: 'x')
move6 = Move.create(user_id: 5, match_id: m2.id, position: 3, value: 'o')
move7 = Move.create(user_id: 4, match_id: m2.id, position: 4, value: 'x')



Draw
m3 = Match.create!(player_x_id: u1.id, player_o_id: u2.id)


mo1 = Move.create!(user_id: u1.id, match_id: m3.id, position: 1, value: 'x')
mo2 = Move.create!(user_id: u2.id, match_id: m3.id, position: 2, value: 'o')
mo3 = Move.create!(user_id: u1.id, match_id: m3.id, position: 3, value: 'x')
mo4 = Move.create!(user_id: u2.id, match_id: m3.id, position: 4, value: 'o')
mo5 = Move.create!(user_id: u1.id, match_id: m3.id, position: 5, value: 'x')
mo6 = Move.create!(user_id: u2.id, match_id: m3.id, position: 6, value: 'o')
mo7 = Move.create!(user_id: u1.id, match_id: m3.id, position: 8, value: 'x')
mo8 = Move.create!(user_id: u2.id, match_id: m3.id, position: 7, value: 'o')
mo9 = Move.create!(user_id: u1.id, match_id: m3.id, position: 9, value: 'x')











