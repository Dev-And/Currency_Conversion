# Dosh

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dosh`. To experiment with that code, run `bin/console` for an interactive prompt.

Test task for Ruby Internship at Provektus. Currency_Conversion.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dosh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dosh

## Usage

require 'dosh'

#Configuration base currency

Money.conversion_rates('UAH', 'USD': 0.038, 'EUR': 0.033)

# Instantiate money objects:

cash1 = Money.new(100, 'UAH')

# Get amount and currency:

cash1.amount #=> 100
cash1.currency #=> "UAH"
cash1.inspect #=> 100  "UAH"

#Convert to a different currency:

cash1.convert_to('USD') #=> 3.80  USD

# Perform operations in different currencies:

five_eur = Money.new(5, 'EUR')

# Arithmetics:

 five_eur + cash1 # => 251.52  UAH
 five_eur - cash1 # => -51.52  UAH
 five_eur / cash1 # => 0.66  UAH
 five_eur * 2 # => 200.00  UAH

# Comparisons:
five_eur > Money.new(20, 'EUR') # => true
five_eur == Money.new(45, 'USD') # => false

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dosh. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

