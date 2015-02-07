require 'rails_helper'

describe "Create task" do 

	let(:user) { create(:user) }
	let!(:project) { create(:project) }
	let!(:task) { create(:task, project: project, title: "Task1") }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}
	
	it 'authenticated user creates task', js: true do
		find("#task_title_#{task.id}").hover
		find(:xpath, "//a[@href='/projects/#{project.id}/tasks/#{task.id}']").click
		sleep 1
		expect(page).not_to have_content 'Task1'
	end
end