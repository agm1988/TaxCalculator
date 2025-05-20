require_relative 'tax_rule'
require_relative '../utils/rounding'

class ImportDutyTax < TaxRule
  def applicable?(product)
    product.imported?
  end

  def compute(product)
    Rounding.round_tax(0.05 * product.price)
  end
end
