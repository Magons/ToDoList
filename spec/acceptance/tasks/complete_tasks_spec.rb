require 'rails_helper'

describe "Complete task" do 

	let(:user) { create(:user) }
	let!(:project) { create(:project) }
	let!(:task) { create(:task, project: project) }

	before {
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}
	
	it 'authenticated user choose task as complete', js: true do
		find('#checked_in').click
		
		screenshot_and_open_image
		expect(task.done).to eq true
	end
end