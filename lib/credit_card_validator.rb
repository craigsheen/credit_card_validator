require "credit_card_validator/version"
require 'credit_card_validator/card'

module CreditCardValidator
  def self.validate(number)
    card = Card.new(number)
    card.process
    card.to_hash
  end
end
