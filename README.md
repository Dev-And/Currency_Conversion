

# Usage

require './Money'

## Configuration base currency

Money.conversion_rates('UAH', 'USD': 0.038, 'EUR': 0.033)

## Instantiate money objects:

cash1 = Money.new(100, 'UAH')

## Get amount and currency:

cash1.amount #=> 100

cash1.currency #=> "UAH"

cash1.inspect #=> 100  "UAH"

## Convert to a different currency:

cash1.convert_to('USD') #=> 3.80  USD

## Perform operations in different currencies:

five_eur = Money.new(5, 'EUR')

## Arithmetics:

 five_eur + cash1 # => 251.52  UAH

 five_eur - cash1 # => -51.52  UAH

 five_eur / cash1 # => 0.66  UAH

 five_eur * 2 # => 200.00  UAH

## Comparisons:
five_eur > Money.new(20, 'EUR') # => true

five_eur == Money.new(45, 'USD') # => false




