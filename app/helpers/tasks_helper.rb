module TasksHelper
	def class_title(bool)
		bool ? 'task_title_complete' : 'task_title'
	end
end
