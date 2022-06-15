require './shopping_cart.rb'
require './input.rb'
require './item.rb'
require './tax_rule.rb'
require './sales_tax_rule.rb'
require './import_tax_rule.rb'
require './tax_calculator.rb'
require './recipt.rb'

file_name = ARGV[0]
total_price = 0
total_tax = 0
cart = ShoppingCart.new()
TaxRule.add_rule(Object.const_get("ImportTaxRule"))
TaxRule.add_rule(Object.const_get("SalesTaxRule"))

  File.open(file_name, "r") do |infile|
      while (line = infile.gets)
           element = Input.parse(line)
           item = Item.new(element[:name],element[:quantity],element[:price])
           cart.add(item)
       end 

# calculate tax for each cart item    
     cart.items().each do |item|
       total_price += TaxCalculator.calculate_price(item)
       item.tax=(TaxCalculator.calculate_taxes(item))
       total_tax += item.tax()
     end
#calculate the total price & total tax for the cart and print the recipt     
     cart.total_price = (total_price)
     cart.total_tax = (total_tax)
     recipt = Recipt.new(cart.clone)
     recipt.print()
 end
