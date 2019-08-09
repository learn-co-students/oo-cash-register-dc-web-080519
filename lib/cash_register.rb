require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction
    
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        
    end

    def add_item(title, amount, quantity=1)
        self.total += amount * quantity
        self.last_transaction = amount *quantity
        quantity.times do
            items << title
        end
        


    end

    def apply_discount
        if discount != 0
        discount = self.discount / 100.to_f
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