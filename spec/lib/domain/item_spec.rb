require 'spec_helper'
require 'domain/item'
require 'domain/product'
require 'bigdecimal'

describe Item do
  let(:product) { Product.new(name: 'box of chocolates', price: price, imported: imported) }
  let(:price) { BigDecimal("12.49") }
  let(:tax) { BigDecimal("1.25") }
  let(:quantity) { 2 }

  subject(:item) { described_class.new(product: product, quantity: quantity, tax: tax) }

  describe '#total_price' do
    let(:imported) { true }

    it 'calculates total price including tax' do
      expected_total = (price + tax) * quantity
      expect(item.total_price).to eq(expected_total)
    end
  end

  describe '#display_name' do
    context 'when the product is imported' do
      let(:imported) { true }

      it 'includes "imported" in the display name' do
        expect(item.display_name).to eq('2 imported box of chocolates')
      end
    end

    context 'when the product is not imported' do
      let(:imported) { false }

      it 'does not include "imported" in the display name' do
        expect(item.display_name).to eq('2 box of chocolates')
      end
    end
  end
end
