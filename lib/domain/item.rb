class Item
  attr_reader :product, :quantity, :tax

  def initialize(product:, quantity:, tax:)
    @product = product
    @quantity = quantity
    @tax = tax
  end

  def total_price
    (product.price + tax) * quantity
  end

  def display_name
    "#{quantity} #{'imported ' if product.imported?}#{product.name}"
  end
end
