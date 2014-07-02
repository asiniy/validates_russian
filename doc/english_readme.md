# validates_russian

[[по-русски](../README.md)]
[![Gem Version](https://badge.fury.io/rb/validates_russian.png)](http://badge.fury.io/rb/validates_russian)
[![Build Status](https://travis-ci.org/asiniy/validates_russian.png?branch=master)](https://travis-ci.org/asiniy/validates_russian)
[![Code Climate](https://codeclimate.com/github/asiniy/validates_russian.png)](https://codeclimate.com/github/asiniy/validates_russian)

Russian specific values validation:

* [INN](http://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика) (InnFormatValidator) Russian analogue of VAT identification number
* [OKPO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_предприятий_и_организаций) (OkpoFormatValidator) Legal code
* [KPP](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт) (KppFormatValidator) Code of reason for registration
* [OGRN](http://ru.wikipedia.org/wiki/Основной_государственный_регистрационный_номер) (OgrnFormatValidator) Main state registration number
* [Correspondent Account Value] (http://ru.wikipedia.org/wiki/Корреспондентский_счёт) (KsFormatValidator)
* [Bank Account Value] (http://ru.wikipedia.org/wiki/Расчётный_счёт) (RsFormatValidator)
* [OKATO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_объектов_административно-территориального_деления) (OkatoFormatValidator)
* [SNILS](http://ru.wikipedia.org/wiki/Страховой_номер_индивидуального_лицевого_счёта) (SnilsFormatValidator)
* [Passport Value](http://ru.wikipedia.org/wiki/Паспорт_гражданина_Российской_Федерации) (PassportFormatValidator)
* [BIK](http://ru.wikipedia.org/wiki/БИК) (BikFormatValidator) Bank Identification Number

## Installation

Add to Gemfile

    gem 'validates_russian'

## Usage

For most of the validators you just want to add this line to your model:

```ruby
validates :attribute, <validator_underscore>: true
```

where `<validator_underscore>` is an underscored, lowercase form from the validator's name (see the example section below).

```ruby
class Legal < ActiveRecord::Base
  validates :kpp, kpp_format: true
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
