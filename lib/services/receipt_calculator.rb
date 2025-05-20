require_relative '../plugins/basic_sales_tax'
require_relative '../plugins/import_duty_tax'
require_relative '../domain/item'
require_relative '../domain/receipt'
require_relative '../input/input_parser'

class ReceiptCalculator
  def initialize(tax_rules = [BasicSalesTax.new, ImportDutyTax.new])
    @tax_rules = tax_rules
  end

  def call(lines)
    parser = InputParser.new
    items = lines.map do |line|
      quantity, product = parser.parse_line(line)
      tax = calculate_tax(product)
      Item.new(product: product, quantity: quantity, tax: tax)
    end
    Receipt.new(items: items)
  end

  private

  def calculate_tax(product)
    @tax_rules.sum { |rule| rule.applicable?(product) ? rule.compute(product) : 0 }
  end
end
