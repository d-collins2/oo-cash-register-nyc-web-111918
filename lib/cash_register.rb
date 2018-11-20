class CashRegister
  attr_reader :discount
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @list = []
    @last_item = 0
  end

  def add_item(item, price, quantity = 1)
    quantity.times {|el| @list << item }
    @last_item = price * quantity
    @total += @last_item
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    dis = (100 - @discount) / 100.0
    total = (@total *= dis).to_i
    "After the discount, the total comes to $#{total}."
  end

  def items
    @list
  end

  def void_last_transaction
    @total -= @last_item
  end
end
