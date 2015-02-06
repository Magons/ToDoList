require 'rails_helper'

describe "Create project" do 

	let(:user) { create(:user) }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
		click_on 'Add TODO List'
		expect(page).to have_content 'Add new Project'
	}
	
	it 'authenticated user creates project', js: true do
		fill_in 'new_project_title', with: "Project"
		click_on 'Save'
		expect(page).to have_content 'Project'
	end

	it 'authenticated user creates project with empty title', js: true do
		fill_in 'new_project_title', with: ""
		click_on 'Save'
		screenshot_and_open_image
		expect(page).to have_content "Title can't be blank"
	end
end