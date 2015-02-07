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
		q = false
		q = find("#task_title_#{task.id}")[:class].include?("task_title_complete")
		expect(q).to eq true
	end
end