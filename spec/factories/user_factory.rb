FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@next.net" }

	factory :user do

		first_name "John"
		last_name "Doe"
		email { generate(:email) }
		password "123456"
		admin false
		
	end

	factory :admin, class: User do
		email { generate(:email) }
	  password "qwertzuiop"
	  admin true
	  first_name "Admin"
	  last_name "User"
	end
end