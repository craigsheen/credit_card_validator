# CreditCardValidator

A simple credit card validator which will return the card type and validity.

## Installation

Add this line to your application's Gemfile:

    gem 'credit_card_validator', :git => "git@github.com:craigsheen/credit_card_validator.git"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card_validator

## Usage

To check a credit card number simply input pass the number to the validate method:

    $ CreditCardValidator.validate(n)

Examples:

		$	CreditCardValidator.validate(4111111111111111)
		$	=> {:type=>"VISA", :number=>"4111111111111111", :valid=>"Valid"}
		$
		$ CreditCardValidator.validate(349999999999999)
		$	=> {:type=>"AMEX", :number=>"349999999999999", :valid=>"Invalid"}
		$
		$	CreditCardValidator.validate(12345)
		$	=> {:error=>"Unknown card type"}


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
