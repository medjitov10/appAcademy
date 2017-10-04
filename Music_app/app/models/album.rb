# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  yaer    :integer          not null
#  band_id :integer          not null
#  live?   :boolean          default(TRUE)
#

class Album < ApplicationRecord
  validates :title, presence: true

  belongs_to :band
end
