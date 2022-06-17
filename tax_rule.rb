module TaxRule
  def self.rules
    @@rules ||= []
  end

  private
  def self.add_rule(klass)
    rules << klass
  end
end
