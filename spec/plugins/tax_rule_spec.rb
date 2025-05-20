require 'spec_helper'
require 'plugins/tax_rule'
require 'domain/product'

# Validates interface enforcement: Forces future devs to implement both methods.
# Ensures misuses are caught early if someone accidentally instantiates TaxRule.
describe TaxRule do
  subject(:tax_rule) { described_class.new }

  let(:product) { Product.new(name: 'test product', price: 10.0) }

  describe '#applicable?' do
    it 'raises NotImplementedError' do
      expect { tax_rule.applicable?(product) }.to raise_error(NotImplementedError)
    end
  end

  describe '#compute' do
    it 'raises NotImplementedError' do
      expect { tax_rule.compute(product) }.to raise_error(NotImplementedError)
    end
  end
end
