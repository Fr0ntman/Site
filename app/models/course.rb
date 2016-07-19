# == Schema Information
#
# Table name: courses
#
#  id                   :integer          not null, primary key
#  title                :string           not null
#  bg_img               :string           not null
#  color                :string
#  description          :text             not null
#  number               :string           not null
#  level                :string           not null
#  original_course_link :string           not null
#  teacher              :string           not null
#  category             :string           not null
#  sub_category         :string           not null
#  speciality           :string
#  created_date         :datetime         not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Course < ActiveRecord::Base
  mount_uploader :bg_img, CourseBgUploader

  has_many :lectures
  has_many :exams

  validates :title, presence: true
  validates :bg_img, presence: true
  validates :color, 
  					presence: true,
  					format: { 
  						with: /\A(#[0-9a-fA-F]{3,6}|rgb\s?\((?:\d{1,3}\,?\s?){3}\))\z/, 
  						message: 'неверный формат цвета'
  					}
  validates :description, presence: true, length: { in: 50..500 }
  validates :number, presence: true
  validates :level, presence: true
  validates :original_course_link, 
  					presence: true,
  					format: { 
  						with: /\A(https?:\/\/)?([\w\.]+)\.([a-z]{2,6}\.?)(\/[\w\.]*)*\/?\z/,
  						message: 'неверный формат адреса'
  					}
  validates :teacher, presence: true
  validates :category, presence: true
  validates :sub_category, presence: true
  #validates :date_of_creating, presence: true, numericality: true, length: { is: 4 }
end
