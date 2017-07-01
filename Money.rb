class Money
  include Comparable
  attr_accessor :amount, :currency
  attr_reader :inspect

  def self.conversion_rates(base_currency, rates={})
    @@base_currency = base_currency
    @@rates = rates
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
    @inspect = "#{"%.2f" % @amount.to_f + " "}" + " #{@currency} "
  end


  def convert_to(convert_currency)
    if convert_currency == @@base_currency
      current_currency = currency
      rate = @@rates[current_currency.to_sym]
      counted_val = amount.to_f / rate.to_f
    else
      rate = @@rates[convert_currency.to_sym]
      counted_val = amount * rate
    end
    converted_currency = Money.new(counted_val, convert_currency)
  end

  def <=>(another)
    if currency != another.currency
      firs_val = amount
      sec_val = another.convert_to(currency)
      firs_val <=> sec_val.amount
    else
      amount <=> another.amount
    end

  end

  def operations(val)
    firs_val = amount
    if val.is_a? (Fixnum)
      sec_val = Money.new(val, currency)
      sum = yield firs_val, sec_val.amount
    elsif currency != val.currency
      sec_val = val.convert_to(currency)
      sum = yield firs_val, sec_val.amount
    else
      sum = yield amount, val.amount
    end
    sum_obj = Money.new(sum, currency).inspect

  end

  def + (val)
    operations(val, &:+)
  end

  def / (val)
    operations(val, &:/)
  end

  def * (val)
    operations(val, &:*)
  end

  def - (val)
    operations(val, &:-)
  end

end

