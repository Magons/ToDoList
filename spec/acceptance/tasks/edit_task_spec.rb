require 'rails_helper'

describe "Update task" do 

	let(:user) { create(:user) }
	let!(:project) { create(:project) }
	let!(:task) { create(:task, project: project, title: "Task1") }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}
	
	it 'authenticated user update project', js: true do
		find("#task_title_#{task.id}").hover
		find(:xpath, "//img[@alt='Pencil task.fw']/..").click
		fill_in "new_task_title_#{task.id}", with: 'Task'
		page.find("#ok_edit_task_#{task.id}").click
		expect(page).not_to have_content 'Task1'
		expect(page).to have_content 'Task'
	end

	it 'authenticated user update project with empty title', js: true do
		find("#task_title_#{task.id}").hover
		find(:xpath, "//img[@alt='Pencil task.fw']/..").click
		fill_in "new_task_title_#{task.id}", with: ''
		page.find("#ok_edit_task_#{task.id}").click
		expect(page).to have_content "Title can't be blank"
	end
end