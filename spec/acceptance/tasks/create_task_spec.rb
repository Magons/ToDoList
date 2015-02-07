require 'rails_helper'

describe "Create task" do 

	let(:user) { create(:user) }
	let!(:project) { create(:project) }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}
	
	it 'authenticated user creates task', js: true do
		fill_in "title_#{project.id}", with: "Task1"
		click_on 'Add Task'
		expect(page).to have_content 'Task1'
	end

	it 'authenticated user creates task with empty title', js: true do
		fill_in "title_#{project.id}", with: ""
		click_on 'Add Task'
		expect(page).to have_content "Title can't be blank"
	end
end