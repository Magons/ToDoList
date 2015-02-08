class Task < ActiveRecord::Base
	has_many :comments

	belongs_to :project
	belongs_to :user

  validates :title, presence: true

	default_scope { order('prioritise') }

	def up (task, id)
		task2 = Task.find_by project_id: id, prioritise: (task.prioritise-1)
		if task2
			task2.prioritise += 1
			task2.save
			task.prioritise -=1
			task.save
		end
	end

	def down (task, id)
		task2 = Task.find_by project_id: id, prioritise: (task.prioritise+1)
		task2.prioritise -= 1
		task2.save
		task.prioritise +=1
		task.save
	end
end
