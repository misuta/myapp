module ProductsHelper

  def ProductsHelper
    count = Product.count
    max_updated_at = Product.maximum(:update_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end


end
