require_relative 'tax_rule'
require_relative '../utils/rounding'

class BasicSalesTax < TaxRule
  BOOK_CATEGORIES = %w[book].freeze
  FOOD_CATEGORIES = %w[chocolate food].freeze
  MEDICINE_CATEGORIES = %w[pill medicine].freeze

  EXEMPT_CATEGORIES = [*BOOK_CATEGORIES, *FOOD_CATEGORIES, *MEDICINE_CATEGORIES].freeze


  def applicable?(product)
    EXEMPT_CATEGORIES.none? { |word| product.name.downcase.include?(word) }
  end

  def compute(product)
    Rounding.round_tax(0.10 * product.price)
  end
end
