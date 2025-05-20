class Receipt
  attr_reader :items

  def initialize(items:)
    @items = items
  end

  def total_sales_tax
    items.sum { |i| i.tax * i.quantity }
  end

  def total_price
    items.sum(&:total_price)
  end
end
