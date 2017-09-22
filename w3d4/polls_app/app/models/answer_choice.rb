# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  option      :text             not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord
  belongs_to :question,
  class_name: 'Question',
  foreign_key: :question_id,
  primary_key: :id

  has_many :responses,
  class_name: 'Response',
  foreign_key: :answer_choices_id,
  primary_key: :id
end
