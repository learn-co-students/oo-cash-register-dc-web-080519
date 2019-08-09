require 'pry'

class CashRegister

    @@all = []
    attr_accessor :discount, :total, :price, :title, :quantity, :cart, :last_transaction

    def initialize(discount = nil)
        @title = title
        @total = 0
        @discount = discount
        @price = 0
        @cart = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        self.title = title
        self.quantity = quantity
        quantity.times do
            self.cart << title
            # binding.pry
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        self.total -= (discount.to_f * 10) 
        if discount 
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def all
        @@all
    end

    def items
        self.cart
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
        end
end
