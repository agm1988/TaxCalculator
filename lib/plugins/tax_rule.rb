class TaxRule
  def applicable?(product)
    raise NotImplementedError
  end

  def compute(product)
    raise NotImplementedError
  end
end
