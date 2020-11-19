require 'pry'

class CashRegister
    attr_accessor :total, :discount, :title, :items

    def initialize(discount = 0)
        @total = 0
        @discount ||= discount
        @items = {}
        @titles = []
    end 

    def add_item(title,price,quantity = 1)
        @total += price * quantity 
        i = 0
        @items[title] = price, quantity
        until i == quantity 
            @titles << title
            i += 1 
        end
    end 

    def apply_discount
        if @discount != 0
            @discount = @discount.to_f / 100 
            @total -= @total * @discount
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end 
    end 

    def items 
        @titles 
    end 
    
    def void_last_transaction
        last_item = @titles[-1]
        last_price = @items[last_item].inject(:*)
        @total -= last_price
        @total 
    end 
    
end 

