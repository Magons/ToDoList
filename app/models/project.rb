class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	belongs_to :user
	validates :title, presence: true
	
	default_scope { order('created_at') }
end
