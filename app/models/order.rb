class Order < ApplicationRecord
	belongs_to :product
	belongs_to :user

  def self.search

    return Order.includes(:product, :user)
    
  end
	validates :product_id, presence: true
	validates :user_id, presence: true
end

