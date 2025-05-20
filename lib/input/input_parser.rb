require 'bigdecimal'
require_relative '../domain/product'

class InputParser
  LINE_REGEX = /^(\d+) (.+) at (\d+\.\d{2})$/

  def parse_line(line)
    match = LINE_REGEX.match(line.strip)
    raise "Invalid format: #{line}" unless match

    quantity = match[1].to_i
    name = match[2]
    price = BigDecimal(match[3])
    imported = name.include?('imported')
    name = name.gsub('imported ', '')

    [quantity, Product.new(name: name, price: price, imported: imported)]
  end
end
