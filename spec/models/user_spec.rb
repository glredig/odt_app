require 'spec_helper'

describe User do
  before { @user = User.new(name: "John Smith", email: "jsmith@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = "" }

  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = "" }

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
end
