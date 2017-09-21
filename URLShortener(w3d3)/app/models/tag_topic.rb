# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord
  validates :topic, uniqueness: true, presence:true

  has_many :taggings,
    class_name: 'Tagging',
    foreign_key: :topic_id,
    primary_key: :id

  has_many :urls,
    through: :taggings,
    source: :shortened_url

  def popular_links
      # self.urls.where(visits: (1..4)).count
      self.class.find_by_sql([<<-SQL, self.id])
        SELECT
          DISTINCT COUNT(shortened_urls.id), shortened_urls.long_url
        FROM
         shortened_urls
        LEFT OUTER JOIN
          visits
          on shortened_urls.id = visits.shortened_url_id
        JOIN
         taggings
         on taggings.shortened_url_id = shortened_urls.id
        WHERE
          taggings.topic_id = ?
        GROUP BY
          shortened_urls.id
        ORDER BY
          COUNT(shortened_urls.id) desc;
      SQL
  end
end
