# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url , uniqueness: true, presence: true
  validates :long_url , uniqueness: true, presence: true

  def self.random_code
    string = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: string)
      string = SecureRandom.urlsafe_base64
    end
    string
  end

  def self.new_shortened_url(user, long_url)
    short_url = self.random_code
    ShortenedUrl.create!(short_url: short_url, long_url: long_url, user_id: user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visitors.where(created_at: (10.minutes.ago..Time.now)).count
  end

  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits,
    class_name: 'Visit',
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :visitors,
    Proc.new{ distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    class_name: 'Tagging',
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :topics,
    through: :taggings,
    source: :topic
end
