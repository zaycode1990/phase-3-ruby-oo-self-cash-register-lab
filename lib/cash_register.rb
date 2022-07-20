require "pry"

class CashRegister
  attr_accessor :items, :discount, :total, :previous_transaction

  def initialize(discount = 0)
    total = 0
    discount = discount
    items = []
  end

  def add_item(title, price, quantity = 1)
    binding.pry
    self.previous_transaction = price * quantity
    self.total += self.previous_transaction
    quantity.times { self.items << title }
  end

  def apply_discount
    binding.pry
    if self.discount != 0
      percentage_discount = (100.0 - self.discount.to_f) / 100
      self.total = (self.total * percentage_discount).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
  self.total > 0 ? self.total -= self.previous_transaction : self.total = 0.0
  end
end
