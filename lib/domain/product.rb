class Product
  attr_reader :name, :price, :imported

  def initialize(name:, price:, imported: false)
    @name = name
    @price = BigDecimal(price.to_s)
    @imported = imported
  end

  def imported?
    imported
  end
end
