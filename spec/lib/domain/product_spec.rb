require 'spec_helper'
require 'domain/product'
require 'bigdecimal'

describe Product do
  subject(:product) { described_class.new(name: name, price: price, imported: imported) }

  let(:price) { 10.0 }
  let(:imported) { false }

  context 'with imported = false' do
    let(:imported) { false }
    let(:name) { 'book' }

    it 'returns false for imported?' do
      expect(product.imported?).to be false
    end

    it 'exposes price as BigDecimal' do
      expect(product.price).to be_a(BigDecimal)
      expect(product.price.to_f).to eq(10.0)
    end
  end

  context 'with imported = true' do
    let(:imported) { true }
    let(:name) { 'imported bottle of perfume' }

    it 'returns true for imported?' do
      expect(product.imported?).to be true
    end
  end
end
