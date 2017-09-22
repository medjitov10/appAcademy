# == Schema Information
#
# Table name: responses
#Pre
#  id                :integer          not null, primary key
#  answer_choices_id :integer
#  user_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Response < ApplicationRecord
  validates :answer_choices_id, presence: true
  validate :current_user_not_responded?

  belongs_to :answer_choice,
  class_name: 'AnswerChoice',
  foreign_key: :answer_choices_id,
  primary_key: :id

  belongs_to :respondent,
  class_name: 'User',
  foreign_key: :user_id,
  primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  def current_user_not_responded?
    # return true if any sibing response is made by same user, false otherwise
    if self.question.responses.where(user_id: self.user_id ).exists?
      errors[:doup] << "can\'t add more then 1 responce"
    end
  end

  def sibling_responses
    # if self.id.nil?
    #   self.question.responses.where.not('responses.id IS NULL')
    # else
    #   self.question.responses.where.not('responses.id = ?', self.id)
    # end
    self.question.responses.where.not(id: self.id)
  end


end
