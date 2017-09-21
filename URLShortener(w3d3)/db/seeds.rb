# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TagTopic.destroy_all
sport = TagTopic.create!(topic: 'Sport')
cs = TagTopic.create!(topic: 'Computer Science')
git = TagTopic.create!(topic: 'Github')
news = TagTopic.create!(topic: 'News')
music = TagTopic.create!(topic: 'Music')
# Tagging.destory_all
Tagging.create!(topic_id: music.id, shortened_url_id: 1)
Tagging.create!(topic_id: news.id, shortened_url_id: 2)
Tagging.create!(topic_id: git.id, shortened_url_id: 3)
Tagging.create!(topic_id: cs.id, shortened_url_id: 4)
Tagging.create!(topic_id: cs.id, shortened_url_id: 5)
