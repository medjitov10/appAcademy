# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

User.destroy_all
a = User.create!(name: 'Jason')
b = User.create!(name: 'Jessica')
c = User.create!(name: 'Will')
d = User.create!(name: 'Steve')

Poll.destroy_all

p1 =   Poll.create!(title: "Jason Poll 1", user_id: a.id)
p2 =   Poll.create!(title: "Jason Poll 2", user_id: a.id)
p3 =   Poll.create!(title: "Jessica Poll 1", user_id: b.id)
p4 =   Poll.create!(title: "Jessica Poll 2", user_id: b.id)
p5 =   Poll.create!(title: "Will Poll 1", user_id: c.id)
p6 =   Poll.create!(title: "Will Poll 2", user_id: c.id)
p7 =   Poll.create!(title: "Steve Poll 1", user_id: d.id)
p8 =   Poll.create!(title: "Steve Poll 2", user_id: d.id)
p9 =   Poll.create!(title: "Steve Poll 3", user_id: d.id)


Question.destroy_all
q1=Question.create!(text: "ARe you Jason?", poll_id: p1.id)
q2=Question.create!(text: "ARe you Jason?2",poll_id: p2.id)
q3=Question.create!(text: "ARe you Poll",   poll_id: p3.id)
q4=Question.create!(text: "ARe you Poll2",  poll_id: p4.id)

AnswerChoice.destroy_all
a1=AnswerChoice.create!(option: 'Jason_choise', question_id: q1.id)
a2=AnswerChoice.create!(option: 'Jessica_choise', question_id: q1.id)
a3=AnswerChoice.create!(option: 'Will_choise', question_id: q1.id)
a4=AnswerChoice.create!(option: 'Steave_choise', question_id: q1.id)

Response.destroy_all
Response.create!(answer_choices_id: a1.id, user_id: a.id)
Response.create!(answer_choices_id: a1.id, user_id: a.id)
Response.create!(answer_choices_id: a2.id, user_id: b.id)
Response.create!(answer_choices_id: a2.id, user_id: b.id)
Response.create!(answer_choices_id: a3.id, user_id: c.id)
Response.create!(answer_choices_id: a4.id, user_id: d.id)
