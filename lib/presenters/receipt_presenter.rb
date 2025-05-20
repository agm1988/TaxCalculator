class ReceiptPresenter
  def initialize(receipt)
    @receipt = receipt
  end

  def to_text
    lines = @receipt.items.map do |item|
      "#{item.display_name}: #{'%.2f' % item.total_price}"
    end
    lines << "Sales Taxes: #{'%.2f' % @receipt.total_sales_tax}"
    lines << "Total: #{'%.2f' % @receipt.total_price}"
    lines.join("\n")
  end
end
