# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, uniqueness: true, presence:true
  validates :email, uniqueness: true, presence:true

  has_many :submitted_urls,
    class_name: 'ShortenedUrl',
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits,
    class_name: 'Visit',
    foreign_key: :user_id,
    primary_key: :id

  has_many :visited_urls,
    through: :visits,
    source: :shortened_url
end
