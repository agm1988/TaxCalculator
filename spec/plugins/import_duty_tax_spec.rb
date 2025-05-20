require 'spec_helper'
require 'plugins/import_duty_tax'
require 'domain/product'
require 'utils/rounding'
require 'bigdecimal'

describe ImportDutyTax do
  subject(:tax_rule) { described_class.new }

  describe '#applicable?' do
    context 'when the product is imported' do
      let(:product) { Product.new(name: 'bottle of perfume', price: 47.50, imported: true) }

      it 'returns true' do
        expect(tax_rule.applicable?(product)).to be true
      end
    end

    context 'when the product is not imported' do
      let(:product) { Product.new(name: 'book', price: 12.49, imported: false) }

      it 'returns false' do
        expect(tax_rule.applicable?(product)).to be false
      end
    end
  end

  describe '#compute' do
    let(:product) { Product.new(name: 'imported bottle of perfume', price: 47.50, imported: true) }

    it 'calculates 5% tax and rounds up to nearest 0.05' do
      # 5% of 47.50 = 2.375 -> rounded up to 2.40
      expect(tax_rule.compute(product)).to eq(BigDecimal('2.40'))
    end
  end
end
