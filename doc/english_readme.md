# validates_russian

[[по-русски](README.md)]
[![Gem Version](https://badge.fury.io/rb/validates_russian.png)](http://badge.fury.io/rb/validates_russian)
[![Build Status](https://travis-ci.org/asiniy/validates_russian.png?branch=master)](https://travis-ci.org/asiniy/validates_russian)
[![Code Climate](https://codeclimate.com/github/asiniy/validates_russian.png)](https://codeclimate.com/github/asiniy/validates_russian)

Russian specific values validation:

* INN (TODO)
* OKPO (TODO)
* OKATO (TODO)
* [KPP](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт) (Code of reason for registration)
* OGRN (TODO)
* Correspondent Account Value (TODO)
* Bank Account Value (TODO)

## Installation

Add to Gemfile

    gem 'validates_russian'

## Usage

```ruby
class Legal < ActiveRecord::Base
  validates :kpp, kpp: true
end

# legal = Legal.new
# legal.kpp = '001122333'
# legal.valid? # => false
# legal.kpp = '525601001'
# legal.valid? # => true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
