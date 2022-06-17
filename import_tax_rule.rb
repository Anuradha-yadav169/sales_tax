require './constants'
module ImportTaxRule
  class << self
    def applies_to?(item)
      item.imported?
    end

    def tax_for(item)
      item.price * tax_rate   
    end

    def tax_rate
      Constants::IMPORT_TAX_RATE
    end
  end
end
