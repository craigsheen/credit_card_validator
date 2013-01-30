require 'spec_helper'
describe CreditCardValidator do
  
  it "should return the type 'AMEX' if passed a number starting with 34 and consisting of 15 digits" do
    check = CreditCardValidator.validate(341111111111111)
    check[:type].should eql('AMEX')
  end
  
  it "should return the type 'AMEX' if passed a number starting with 37 and consisting of 15 digits" do
    check = CreditCardValidator.validate(371111111111111)
    check[:type].should eql('AMEX')
  end
  
  it "should return the type 'Discover' if passed a number starting with 6011 and consisting of 16 digits" do
    check = CreditCardValidator.validate(6011111111111111)
    check[:type].should eql('Discover')
  end
  
  it "should return the type 'Mastercard' if passed a number starting with 51 and consisting of 16 digits" do
    check = CreditCardValidator.validate(5111111111111111)
    check[:type].should eql('Mastercard')
  end
  
  it "should return the type 'Mastercard' if passed a number starting with 52 and consisting of 16 digits" do
    check = CreditCardValidator.validate(5211111111111111)
    check[:type].should eql('Mastercard')
  end
  
  it "should return the type 'Mastercard' if passed a number starting with 53 and consisting of 16 digits" do
    check = CreditCardValidator.validate(5311111111111111)
    check[:type].should eql('Mastercard')
  end
  
  it "should return the type 'Mastercard' if passed a number starting with 54 and consisting of 16 digits" do
    check = CreditCardValidator.validate(5411111111111111)
    check[:type].should eql('Mastercard')
  end
  
  it "should return the type 'Mastercard' if passed a number starting with 55 and consisting of 16 digits" do
    check = CreditCardValidator.validate(5511111111111111)
    check[:type].should eql('Mastercard')
  end
  
  it "should return the type 'VISA' if passed a number starting with 4 and consisting of 13 digits" do
    check = CreditCardValidator.validate(4111111111111)
    check[:type].should eql('VISA')
  end
  
  it "should return the type 'VISA' if passed a number starting with 4 and consisting of 14 digits" do
    check = CreditCardValidator.validate(41111111111111)
    check[:type].should eql('VISA')
  end
  
  it "should return the type 'VISA' if passed a number starting with 4 and consisting of 15 digits" do
    check = CreditCardValidator.validate(411111111111111)
    check[:type].should eql('VISA')
  end
  
  it "should return the type 'VISA' if passed a number starting with 4 and consisting of 16 digits" do
    check = CreditCardValidator.validate(4111111111111111)
    check[:type].should eql('VISA')
  end
  
  it "should return the error 'Unknown card type' for numbers that do not match the above" do
    check = CreditCardValidator.validate(12345)
    check[:error].should eql('Unknown card type')
  end
  
  # Luhn Algorithm Checks
  
  it "should return the valid 'Valid' if passed a valid card" do
    check = CreditCardValidator.validate(4111111111111111)
    check[:valid].should eql('Valid')
  end
  
  it "should return the valid 'Valid' if passed a invalid card" do
    check = CreditCardValidator.validate(349999999999999)
    check[:valid].should eql('Invalid')
  end
  
end