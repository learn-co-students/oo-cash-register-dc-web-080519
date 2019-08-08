require 'pry'

class CashRegister
    attr_accessor :total, :discount, :cart, :last_amount

    def initialize(discount=0)
        #binding.pry
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item (title, price, quantity=1)
        self.total += price*quantity
        self.last_amount = price*quantity
        quantity.times do
            @cart << title
        end
    end

    def apply_discount
        if self.discount != 0
            self.total -= (self.total*self.discount/100).to_f
            #binding.pry
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        self.cart
    end

    def void_last_transaction
        #binding.pry
        self.total -= self.last_amount
    end

end
