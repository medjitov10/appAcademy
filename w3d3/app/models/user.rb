# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :enrollments,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: 'Enrollment'

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
end