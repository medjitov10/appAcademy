# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true , uniqueness: true

  has_many :authored_polls,
    class_name: 'Poll',
    foreign_key: :user_id,
    primary_key: :id

  has_many :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id

  def completed_polls
    select
       title AS poll,  questions.text AS question, users.name,
       responses.answer_choices_id
    from
      polls
    JOIN
      questions
    ON
      poll_id = polls.id
    JOIN
      answer_choices
    ON
      question_id = questions.id
    JOIN
      responses
    ON
      answer_choices_id = answer_choices.id
    JOIN
      users
    ON
      users.id = 49
    GROUP BY
      users.name
    Order By
      COUNT(questions.id)

  end
end
