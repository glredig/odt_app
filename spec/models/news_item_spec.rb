require 'spec_helper'

describe NewsItem do
  let(:user) { FactoryGirl.create(:user) }
  before { @news_item = user.news_items.build(title: "Test News Item", content: "Test news content") }

  subject { @news_item }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when it has no title" do
	before { @news_item.title = nil }
	it { should_not be_valid }
  end

  describe "when it has no content" do
	before { @news_item.content = nil }
	it { should_not be_valid }
  end

  describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				NewsItem.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end
end
