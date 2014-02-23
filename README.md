# validates_russian

[[english_doc](doc/english_readme.md)]
[[инструкции разработчикам](https://github.com/asiniy/validates_russian/wiki/Инструкции-разработчикам)]
[![Gem Version](https://badge.fury.io/rb/validates_russian.png)](http://badge.fury.io/rb/validates_russian)
[![Build Status](https://travis-ci.org/asiniy/validates_russian.png?branch=master)](https://travis-ci.org/asiniy/validates_russian)
[![Code Climate](https://codeclimate.com/github/asiniy/validates_russian.png)](https://codeclimate.com/github/asiniy/validates_russian)

Валидация русских значений:

* [ИНН](http://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика) (InnFormatValidator)
* [ОКПО](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_предприятий_и_организаций) (OkpoFormatValidator)
* [КПП](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт) (KppFormatValidator)
* [ОГРН](http://ru.wikipedia.org/wiki/Основной_государственный_регистрационный_номер) (OgrnFormatValidator)
* [Корреспондентский счёт](http://ru.wikipedia.org/wiki/Корреспондентский_счёт) (KsFormatValidator)
* [Рассчётный счёт](http://ru.wikipedia.org/wiki/Расчётный_счёт) (RsFormatValidator)
* [OKATO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_объектов_административно-территориального_деления) (OkatoFormatValidator)
* СНИЛС (TODO v0.0.6)
* Значение паспорта (TODO v0.0.6)

## Установка

Добавь в Gemfile

    gem 'validates_russian'

## Использование

Используй валидаторы в своей модели

```ruby
validates :attribute, <validator_underscore>: true
```

где `<validator_underscore>` это название валидатора

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
