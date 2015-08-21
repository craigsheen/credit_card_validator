require 'spec_helper'

describe CreditCardValidator::Card do
  describe '.get_card_type' do
    it 'should set card type to AMEX' do
      card = CreditCardValidator::Card.new(371111111111111)
      card.get_card_type
      expect(card.type).to eq 'AMEX'
    end

    it 'should set card type to Discover' do
      card = CreditCardValidator::Card.new(6011111111111111)
      card.get_card_type
      expect(card.type).to eq 'Discover'
    end

    it 'should set card type to Mastercard' do
      card = CreditCardValidator::Card.new(5111111111111111)
      card.get_card_type
      expect(card.type).to eq 'Mastercard'
    end

    it 'should set card type to VISA' do
      card = CreditCardValidator::Card.new(4111111111111)
      card.get_card_type
      expect(card.type).to eq 'VISA'
    end
  end

  describe '.validate' do
    it 'should set card valid to valid' do
      card = CreditCardValidator::Card.new(4111111111111111)
      card.validate
      expect(card.valid).to eq 'Valid'
    end

    it 'should set card valid to invalid' do
      card = CreditCardValidator::Card.new(4111111111117)
      card.validate
      expect(card.valid).to eq 'Invalid'
    end
  end
end