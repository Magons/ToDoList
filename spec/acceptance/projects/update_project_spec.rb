require 'rails_helper'

describe "Update project" do 

	let(:user) { create(:user) }
	let!(:project) { create(:project) }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}
	
	it 'authenticated user update project', js: true do
		find('.ProjectTitle').hover
		page.find("#edit_project_#{project.id}").click
		fill_in "new_project_title_#{project.id}", with: 'Project123'
		page.find("#ok_edit_#{project.id}").click
		expect(page).not_to have_content 'My String'
		expect(page).to have_content 'Project123'
	end

	it 'authenticated user update project with empty title', js: true do
		find('.ProjectTitle').hover
		page.find("#edit_project_#{project.id}").click
		fill_in "new_project_title_#{project.id}", with: ''
		page.find("#ok_edit_#{project.id}").click
		screenshot_and_open_image
		expect(page).to have_content "Title can't be blank"
	end
end