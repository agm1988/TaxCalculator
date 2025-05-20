require 'spec_helper'
require 'domain/receipt'
require 'domain/item'
require 'domain/product'
require 'bigdecimal'

describe Receipt do
  let(:product1) { Product.new(name: 'book', price: 12.49, imported: false) }
  let(:product2) { Product.new(name: 'imported perfume', price: 27.99, imported: true) }

  let(:item1) { Item.new(product: product1, quantity: 2, tax: BigDecimal('0.00')) }
  let(:item2) { Item.new(product: product2, quantity: 1, tax: BigDecimal('4.20')) }

  subject(:receipt) { described_class.new(items: [item1, item2]) }

  describe '#total_sales_tax' do
    it 'calculates the total tax of all items (tax × quantity)' do
      expect(receipt.total_sales_tax).to eq(BigDecimal('4.20'))
    end
  end

  describe '#total_price' do
    it 'calculates the total price including tax for all items' do
      expected_total = item1.total_price + item2.total_price
      expect(receipt.total_price).to eq(expected_total)
    end
  end
end
