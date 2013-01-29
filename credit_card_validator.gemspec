# -*- encoding: utf-8 -*-
require File.expand_path('../lib/credit_card_validator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Craig Sheen"]
  gem.email         = ["craig@hotmail.co.uk"]
  gem.description   = %q{A simple gem to work out the type and validity from a credit card number}
  gem.summary       = %q{A simple gem to work out the type and validity from a credit card number}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "credit_card_validator"
  gem.require_paths = ["lib"]
  gem.version       = CreditCardValidator::VERSION
end
