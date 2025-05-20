require 'spec_helper'
require 'utils/rounding'

describe Rounding do
  describe '.round_tax' do
    subject(:rounded) { described_class.round_tax(input) }

    context 'when input is already a multiple of 0.05' do
      let(:input) { BigDecimal("1.50") }

      it 'returns the same amount rounded to two decimals' do
        expect(rounded).to eq(BigDecimal("1.50"))
      end
    end

    context 'when input needs to be rounded up to nearest 0.05' do
      [  #Input Rounded Output
        [0.5625, 0.60],
        [1.499,  1.50],
        [1.511,  1.55],
        [0.01,   0.05],
        [0.00,   0.00]
      ].each do |ctx|
        context "with amount #{ctx[0]}" do
          let(:input) { ctx[0] }
          it { is_expected.to eq(ctx[1]) }
        end
      end
    end
  end
end
