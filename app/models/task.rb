class Task < ActiveRecord::Base
  validates :title, presence: true
	belongs_to :project
	belongs_to :user
	has_many :comments
end
