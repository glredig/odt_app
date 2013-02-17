require 'spec_helper'

describe "blog" do
	subject { page }

	describe "index" do

		describe "as general user" do
			let(:user) { FactoryGirl.create(:user) }
			let!(:blogpost) { FactoryGirl.create(:blogpost, user: user, title: "The Title", content: "Blah") }
			before do
				sign_in user
				visit blogposts_path
			end
			it { should have_selector('h1', text: "Blog") }
			it { should have_selector('li', text: "The Title") }
		end
	end
end