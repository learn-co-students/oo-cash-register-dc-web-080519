require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount=0)
        @items = []
        @total = 0
        @discount = discount
    end

    def add_item(item, price, quantity=1)
        self.total += price*quantity
        self.last_transaction = price * quantity
        quantity.times do
            items << item
        end
    end

    def apply_discount
        if discount > 0
            discount = self.discount/100.to_f
            self.total -= self.total * discount
            "After the discount, the total comes to $800."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end




end