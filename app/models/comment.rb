class Comment < ActiveRecord::Base
  belongs_to :task
  validates :body, presence: true
	belongs_to :user
end
