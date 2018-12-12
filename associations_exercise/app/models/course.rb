# == Schema Information
#
# Table name: courses
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord
  has_many :enrollments,
    class_name: 'Enrollment',
    primary_key: 'id',
    foreign_key: 'course_id'
  
  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :prerequisite,
    class_name: 'Course',
    foreign_key: 'prereq_id',
    primary_key: 'id'

  belongs_to :instructor,
    class_name: 'User',
    foreign_key: 'instructor_id',
    primary_key: 'id'
  
end
