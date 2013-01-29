require "credit_card_validator/version"

module CreditCardValidator
  
  def self.validate(number)
    number = number.to_s.gsub(/\s+/, "")
    check = {}
    if (number[0,2] == "34" || number[0,2] == "37") && number.length == 15
      check[:type] = "AMEX"
    elsif number[0,4] == "6011" && number.length == 16
      check[:type] = "Discover"
    elsif (number[0,2] == "51" || number[0,2] == "52" || number[0,2] == "53" || number[0,2] == "54" || number[0,2] == "55") && number.length == 16
      check[:type] = "Mastercard"
    elsif number [0,1] == "4" && (number.length == 13 || number.length == 14 || number.length == 15 || number.length == 16)
      check[:type] = "VISA"
    else
      check[:error] = "Unknown card type"
      return check
    end
    
    check[:number] = number
    
    total = 0
    number.reverse.split("").each_with_index do |n,index|
      if index % 2 != 0
        total += n.to_i * 2 > 9 ? n.to_i * 2 - 9 : n.to_i * 2
      else
        total += n.to_i
      end
    end

    if total % 10 == 0
      check[:valid] = "Valid"
    else
      check[:valid] = "Invalid"
    end
    
    return check
    
  end

end
