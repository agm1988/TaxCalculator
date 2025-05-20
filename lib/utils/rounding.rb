module Rounding
  def self.round_tax(amount)
    (BigDecimal((amount * 20).ceil) / 20).round(2)
  end
end
