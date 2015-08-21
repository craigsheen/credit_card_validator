module CreditCardValidator
  class Card
    attr_accessor :number, :type, :valid, :error

    def initialize(number)
      @number = number.to_s
    end

    def process
      get_card_type
      validate
    end

    def get_card_type
      if amex?
        @type = "AMEX"
      elsif discover?
        @type = "Discover"
      elsif mastercard?
        @type = "Mastercard"
      elsif visa?
        @type = "VISA"
      else
        @error = "Unknown card type"
      end
    end

    def validate
      total = 0
      number.reverse.split("").each_with_index do |n,index|
        if index % 2 != 0
          total += n.to_i * 2 > 9 ? n.to_i * 2 - 9 : n.to_i * 2
        else
          total += n.to_i
        end
      end

      if total % 10 == 0
        @valid = "Valid"
      else
        @valid = "Invalid"
      end
    end

    def to_hash
      if error.nil?
        { type: type, number: number, valid: valid }
      else
        { error: error, number: number }
      end
    end

    def amex?
      number_starts_with?(["34", "37"]) && number.length == 15
    end

    def discover?
      number_starts_with?("6011") && number.length == 16
    end

    def mastercard?
      number_starts_with?(["51", "52", "53", "54", "55"]) && number.length == 16
    end

    def visa?
      number_starts_with?("4") && number.length.between?(13,16)
    end

    private
    def number_starts_with?(numbers)
      [numbers].flatten.any? { |num| number.start_with? num }
    end
  end
end