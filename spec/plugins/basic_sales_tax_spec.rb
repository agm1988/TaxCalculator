require 'spec_helper'
require 'plugins/basic_sales_tax'
require 'domain/product'
require 'utils/rounding'
require 'bigdecimal'

describe BasicSalesTax do
  subject(:tax_rule) { described_class.new }

  describe '#applicable?' do
    context 'when the product is a book' do
      let(:product) { Product.new(name: 'book', price: 12.49) }

      it 'returns false (tax exempt)' do
        expect(tax_rule.applicable?(product)).to be false
      end
    end

    context 'when the product is chocolate' do
      let(:product) { Product.new(name: 'box of chocolates', price: 10.00) }

      it 'returns false (food is tax exempt)' do
        expect(tax_rule.applicable?(product)).to be false
      end
    end

    context 'when the product is headache pills' do
      let(:product) { Product.new(name: 'headache pills', price: 9.75) }

      it 'returns false (medicine is tax exempt)' do
        expect(tax_rule.applicable?(product)).to be false
      end
    end

    context 'when the product is a music CD' do
      let(:product) { Product.new(name: 'music CD', price: 14.99) }

      it 'returns true (not tax exempt)' do
        expect(tax_rule.applicable?(product)).to be true
      end
    end
  end

  describe '#compute' do
    let(:product) { Product.new(name: 'music CD', price: 14.99) }

    it 'calculates 10% tax and rounds up to nearest 0.05' do
      # 10% of 14.99 = 1.499 → rounded up to 1.50
      expect(tax_rule.compute(product)).to eq(BigDecimal('1.50'))
    end
  end
end
