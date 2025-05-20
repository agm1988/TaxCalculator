require 'spec_helper'
require 'presenters/receipt_presenter'
require 'domain/product'
require 'domain/item'
require 'domain/receipt'
require 'bigdecimal'

describe ReceiptPresenter do
  subject(:presenter) { described_class.new(receipt) }

  let(:book) { Product.new(name: 'book', price: 12.49) }
  let(:cd) { Product.new(name: 'music CD', price: 14.99) }
  let(:choco) { Product.new(name: 'chocolate bar', price: 0.85) }

  let(:first_item) { Item.new(product: book, quantity: 2, tax: BigDecimal('0.00')) }
  let(:second_item) { Item.new(product: cd, quantity: 1, tax: BigDecimal('1.50')) }
  let(:third_item) { Item.new(product: choco, quantity: 1, tax: BigDecimal('0.00')) }

  let(:receipt) { Receipt.new(items: [first_item, second_item, third_item]) }

  describe '#to_text' do
    it 'returns a formatted receipt string with item prices, taxes, and total' do
      expected_output = <<~TEXT.chomp
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      TEXT

      expect(presenter.to_text).to eq(expected_output)
    end
  end
end
