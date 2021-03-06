require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button "Sign in" }
		
			it { should have_selector('h1', text: 'Sign in') }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }

			describe "after visiting another page" do
				before { click_link "home" }
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before { sign_in user }

			it { should have_selector('title', text: user.name) }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Settings', href: edit_user_path(user)) }
			it { should have_link('Sign Out', href: signout_path) }
			it { should_not have_link('sign in', href: signin_path) }

			describe "followed by sign out" do
				before  { click_link "Sign Out" }
				it { should have_link("sign in") }
			end
		end
	end

	describe "authorization" do

		describe "for non-signed-in users" do
			let(:user) { FactoryGirl.create(:user) }

			describe "in the Users controller" do
				before { visit edit_user_path(user) }
				it { should have_selector('title', text: 'Sign in') }
			end

			describe "submitting to the update action" do
				before { put user_path(user) }
				specify { response.should redirect_to(signin_path) }
			end

			describe "when attempting to visit a protected page" do
				before do
					visit edit_user_path(user)
					fill_in "Email", with: user.email
					fill_in "Password", with: user.password
					click_button "Sign in"
				end

				describe "after signing in" do

					it "should render the visited page" do

						page.should have_selector('title', text: 'Edit profile')
					end
				end
			end
		end

		describe "as wrong user" do
			let(:user) { FactoryGirl.create(:user) }
			let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
			before { sign_in user }

			describe "visiting Users#edit page" do
				before { visit edit_user_path(wrong_user) }
				it { should_not have_selector('title', text: 'Edit user') }
			end

			describe "submitting a PUT request to the Users#update action" do
				before { put user_path(wrong_user) }
				specify { response.should redirect_to(root_path) }
			end
		end

		describe "as non-admin user" do
			let(:user) { FactoryGirl.create(:user) }
			let(:non_admin) { FactoryGirl.create(:user) }

			before { sign_in non_admin }

			describe "submitting a DELETE request to the Users#destroy action" do
				before { delete user_path(user) }
				specify { response.should redirect_to(root_path) }
			end

			# describe "trying to create a new blog post" do
			# 	before { visit new_blogpost_path }
			# 	it { should_not have_selector('h1', text: 'New Blog entry')}
			# end
		end

		describe "as an admin user" do
			let(:user) { FactoryGirl.create(:user) }
			let(:admin) { FactoryGirl.create(:admin) }

			before { sign_in admin }

			describe "submitting a DELETE request to the Users#destroy action for their own account" do
				before { delete user_path(admin) }
				specify { response.should redirect_to(users_path) }
			end
		end
	end
end
