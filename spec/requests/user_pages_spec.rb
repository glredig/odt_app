require 'spec_helper'

describe 'User pages' do
	
	subject { page }

	describe "index" do

		describe "delete links" do

			describe "as an admin user" do
				before do
					@user1 = FactoryGirl.create(:user) 
					@admin1 = FactoryGirl.create(:admin) 
					sign_in @admin1
					visit users_path
				end

				it { should have_link('Delete', href: user_path(User.first)) }

				it "should be able to delete a user" do
					expect { click_link('Delete') }.to change(User, :count).by(-1)
				end

				it { should_not have_link('Delete', href: user_path(:admin)) }
			end
		end		
	end

	describe "signup page" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Sign up') }
		it { should have_selector('title', text: 'Sign up') }

		describe "signup" do

			before { visit signup_path }

			let(:submit) { "Create my account" }

			it { should have_selector('h1', text: 'Sign up') }
			it { should have_selector('input', value: 'Create my account') }

			describe "with invalid information" do
				it "should not create a new user" do
					expect { click_button submit }.not_to change(User, :count)
				end
			end

			describe "with valid information" do
				before do
					fill_in "signup_name", with: "John Smith"
					fill_in "signup_email", with: "jsmith@example.com"
					fill_in "signup_password", with: "foobar"
					fill_in "signup_confirmation", with: "foobar"
				end

				it "should create a new user" do
					expect { click_button "Create my account" }.to change(User, :count).by(1)
				end

			end
		end
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }

		before { visit user_path(user) }

		it { should have_selector('h1', text: user.name) }
		it { should have_selector('title', text: user.name) }
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_selector('h1', text: "Update your profile") }
			it { should have_selector('title', text: "Edit profile") }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_name) { "New Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Name", with: new_name
				fill_in "Email", with: new_email
				fill_in "user_password", with: user.password
				fill_in "Password confirmation", with: user.password
				click_button "Save changes"
			end

			it { should have_selector('title', text: new_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Sign Out', href: signout_path) }
			specify { user.reload.name.should == new_name }
			specify { user.reload.email.should == new_email }
		end
	end
end