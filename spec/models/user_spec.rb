require 'spec_helper'

describe User do
  before { @user = User.new(name: "John Smith", email: "jsmith@example.com", 
                            password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:blogposts) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = " " }

  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " " }

  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "a" * 51 }

  	it { should_not be_valid }
  end

  describe "when email format is not valid" do
  	it "should be invalid" do
  		addresses = %w[user@example,com useratexample.com user@example. user@ex_ample.com user@ex+ample.com]

  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			@user.should_not be_valid
  		end
  	end
  end

  describe "when email format is valid" do
  	it "should be valid" do
  		addresses = %w[user@example.net user@example.org user.1_a@example.a.com]

  		addresses.each do |valid_address|
  			@user.email = valid_address
  			@user.should be_valid
  		end
  	end
  end

  describe "when email address is already in use" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end

  	it { should_not be_valid }
  end

  describe "when password field is blank" do
    before { @user.password = @user.password_confirmation = " " }

    it { should_not be_valid }
  end

  describe "when password and confirmation don't match" do
    before { @user.password_confirmation = "notthesame" }

    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }

    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password_confirmation = @user.password = "a" * 5 }

    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "blogpost associations" do

    before { @user.save }

    let!(:older_blogpost) do
      FactoryGirl.create(:blogpost, user: @user, title: "Title1", created_at: 1.day.ago)
    end
    let!(:newer_blogpost) do
      FactoryGirl.create(:blogpost, user: @user, title: "Title2", created_at: 1.hour.ago)
    end

    it "should have the right blogposts in the right order" do
      @user.blogposts.should == [newer_blogpost, older_blogpost]
    end

    it "should destroy associated blogposts" do
      blogposts = @user.blogposts.dup
      @user.destroy
      blogposts.should_not be_empty
      blogposts.each do |blogpost|
        Blogpost.find_by_id(blogpost.id).should be_nil
      end
    end
  end 
end
