FactoryGirl.define do
	factory :order do

		association :user, factory: :user, strategy: :build
		association :product, factory: :product, strategy: :build
	end
end