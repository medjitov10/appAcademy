# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer
#  create!d_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  has_many :answer_choices,
  class_name: 'AnswerChoice',
  foreign_key: :question_id,
  primary_key: :id

  belongs_to :poll,
  class_name: 'Poll',
  foreign_key: :poll_id,
  primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def result
    # <<-SQL , self.text
    # SELECT
    #   option,  COUNT(responses.answer_choices_id)
    # FROM
    #   answer_choices
    # JOIN
    #   questions
    #   ON
    #   question_id = questions.id
    # LEFT OUTER JOIN
    #   responses
    #   ON
    #   answer_choices.id = responses.answer_choices_id
    # WHERE
    #   questions.text = ?
    # GROUP BY
    #   option
    # ORDER BY
    #   COUNT(responses.answer_choices_id)
    # SQL

    arr = AnswerChoice.select('option,  COUNT(responses.answer_choices_id) AS count')
      .joins(:question)
      .joins(<<-SQL
      LEFT OUTER JOIN
        responses
      ON
        answer_choices.id = responses.answer_choices_id
      SQL
     )
      .where('questions.text = ?', self.text)
      .group(:option)
      .order('COUNT(responses.answer_choices_id)')
    hash = {}
    arr.each do |el|
      hash[el.option] = el.count
    end

    hash
    #
    # choices = self.answer_choices.includes(:responses)
    # hash = {}
    # choices.each do |choice|
    #   hash[choice.option] = choice.responses.length
    # end
    # hash

  end
end
