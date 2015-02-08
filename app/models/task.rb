class Task < ActiveRecord::Base
	has_many :comments

	belongs_to :project
	belongs_to :user

  validates :title, presence: true

	default_scope { order('prioritise') }

	def task_prioritise (id, flag)
		flag==1 ? up = -1 : up = 1
		flag==-1 ? down = -1 : down = 1
		task2 = Task.find_by project_id: id, prioritise: (self.prioritise + flag)
		if task2
			task2.prioritise += up
			task2.save
			self.prioritise += down
			self.save
		end
	end
end
