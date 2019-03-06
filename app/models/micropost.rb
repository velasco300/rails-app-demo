class Micropost < ApplicationRecord
  has_many :comments, class_name: 'Micropost', foreign_key: 'pid'
  belongs_to :subject, class_name: 'Micropost', foreign_key: 'pid'
end
