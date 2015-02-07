require 'rails_helper'

describe "User try change his avatar" do 

	let(:user) { create(:user) }
	before { 
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	}

	it 'user try to change avatar' do
		find(:xpath, "//a[@href='/me']").click
		expect(current_path).to eq '/me'
		attach_file 'user_avatar', "#{Rails.root}/app/assets/images/plus.fw.png"
		click_on 'Update User'
		expect(page).to have_css ".profile_avatar"
	end
end