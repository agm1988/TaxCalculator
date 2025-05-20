#!/usr/bin/env ruby
require_relative '../lib/services/receipt_calculator'
require_relative '../lib/presenters/receipt_presenter'

lines = []
puts 'Enter items (empty line to finish):'

while (input = gets.strip) != ''
  lines << input
end

receipt = ReceiptCalculator.new.call(lines)

puts "\n--- Receipt ---"
puts ReceiptPresenter.new(receipt).to_text
