require 'rails_helper'

describe "Delete project" do 

	let(:user) { create(:user) }
	let!(:project) { create(:project) }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}
	
	it 'authenticated user delete project', js: true do
		find('.ProjectTitle').hover
		click_on "trash_#{project.id}"
		page.driver.browser.accept_js_confirms
		page.driver.browser.reject_js_confirms
		expect(page).to have_content 'Project was successfully destroyed.'
	end
end