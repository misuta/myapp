FactoryGirl.define do

	factory :comment do
		body "this is a comment"
		rating 5

		association :user, factory: :user, strategy: :build
		association :product, factory: :product, strategy: :build
	end
end