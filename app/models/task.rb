class Task < ActiveRecord::Base
  validates :title, presence: true
	belongs_to :project
	belongs_to :user
	has_many :comments
	default_scope { order('prioritise') }

	def up (task, id)
		task2 = Task.find_by project_id: id, prioritise: (task.prioritise-1)
		task2.prioritise += 1
		task2.save
		task.prioritise -=1
		task.save
	end

	def down (task, id)
		task2 = Task.find_by project_id: id, prioritise: (task.prioritise+1)
		task2.prioritise -= 1
		task2.save
		task.prioritise +=1
		task.save
	end
end
