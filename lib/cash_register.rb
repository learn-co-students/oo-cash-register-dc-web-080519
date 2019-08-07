require "pry"

class CashRegister
  # program can read and write all values below
  attr_accessor :total, :discount, :cart, :last_transaction

  # all new instances begin with total of 0, optional discount, and empty cart
  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)
    # add price of all items to total
    self.total += (price * quantity)

    # add each individual item to cart
    quantity.times do
      self.cart << title
    end

    # keep track of this transaction's total price
    self.last_transaction = (price * quantity)
  end

  def apply_discount
    # make sure there's a discount at all
    if self.discount == 0
      "There is no discount to apply."
    else
      # if there is, convert discount to float and subtract from 100%
      price_multiplier = ((100 - self.discount).to_f)/100.0
      # apply discount to the total and return string
      self.total = self.total * price_multiplier
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    # return all individual items, shoveled into 'cart' array during add_item method
    self.cart
  end

  def void_last_transaction
    # subtract value of most recent transaction, saved during add_item, from total
    self.total -= last_transaction
  end
end
