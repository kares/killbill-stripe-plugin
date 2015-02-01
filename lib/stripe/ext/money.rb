require 'money/money'

class Money

  def initialize(obj, currency = Money.default_currency, bank = Money.default_bank)
    if obj.is_a?(Integer)
      @fractional = as_d(obj)
      @currency = Currency.wrap(currency)
      @bank = bank
    elsif obj.is_a?(Money)
      @fractional = obj.fractional
      @currency = obj.currency
      @bank = obj.bank
    else # slow-path (6.2.1)
      @fractional = obj.respond_to?(:fractional) ? obj.fractional : as_d(obj)
      @currency = obj.respond_to?(:currency) ? obj.currency : Currency.wrap(currency)
      @bank = obj.respond_to?(:bank) ? obj.bank : bank
    end
  end

end