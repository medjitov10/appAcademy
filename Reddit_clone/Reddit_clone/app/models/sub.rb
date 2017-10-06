# == Schema Information
#
# Table name: subs
#
#  id                                                              :integer          not null, primary key
#  moderator_id                                                    :integer          not null
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  description                                                     :string
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#  title                                                           :string
#

class Sub < ApplicationRecord
  belongs_to :moderator,
  class_name: "User",
  foreign_key: :moderator_id,
  primary_key: :id
  has_many :posts

  validates :title, :moderator_id , presence: true
end
