require 'spec_helper'

describe Blogpost do
	let(:user) { FactoryGirl.create(:user) }
	before { @blogpost = user.blogposts.build(content: "Lorem ipsum") }


	subject { @blogpost }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @blogpost.user_id = nil}
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @blogpost.content = " " }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Blogpost.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end
end
