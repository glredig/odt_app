FactoryGirl.define do
	factory :user do
		name 		"Gabe"
		email		"glredig@example.com"
		password	"password"
		password_confirmation "password"
	end
end