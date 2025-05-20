require 'spec_helper'
require 'input/input_parser'
require 'domain/product'

RSpec.describe InputParser do
  subject(:parser) { described_class.new }

  describe '#parse_line' do
    context 'when the line is valid and non-imported' do
      let(:line) { '2 book at 12.49' }

      it 'parses the quantity and product correctly' do
        quantity, product = parser.parse_line(line)

        expect(quantity).to eq(2)
        expect(product.name).to eq('book')
        expect(product.price).to eq(BigDecimal('12.49'))
        expect(product.imported?).to be false
      end
    end

    context 'when the line is valid and imported' do
      let(:line) { '1 imported bottle of perfume at 47.50' }

      it 'parses the quantity and imported product correctly' do
        quantity, product = parser.parse_line(line)

        expect(quantity).to eq(1)
        expect(product.name).to eq('bottle of perfume')
        expect(product.price).to eq(BigDecimal('47.50'))
        expect(product.imported?).to be true
      end
    end

    context 'when the format is invalid' do
      it 'raises an error with an informative message' do
        bad_line = 'one perfume at 47.50'
        expect {
          parser.parse_line(bad_line)
        }.to raise_error(RuntimeError, /Invalid format/)
      end
    end
  end
end
