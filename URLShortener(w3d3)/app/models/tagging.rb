# == Schema Information
#
# Table name: taggings
#
#  id               :integer          not null, primary key
#  topic_id         :integer          not null
#  shortened_url_id :integer          not null
#

class Tagging < ApplicationRecord
  validates :topic_id, :shortened_url_id, presence: true

  belongs_to :topic,
    class_name: 'TagTopic',
    foreign_key: :topic_id,
    primary_key: :id

  belongs_to :shortened_url,
    class_name: 'ShortenedUrl',
    foreign_key: :shortened_url_id,
    primary_key: :id

end
