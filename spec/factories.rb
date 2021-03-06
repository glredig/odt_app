FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "password"
		password_confirmation "password"

		factory :admin do
			admin true
		end
	end

	factory :blogpost do
		content "Lorem ipsum"
		user
	end

	factory :video_lesson do
		title "Video Title"
		description "Video Description"
	end
end