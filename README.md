# validates_russian

[[english_doc](doc/english_readme.md)]
[[инструкции разработчикам](https://github.com/asiniy/validates_russian/wiki/Инструкции-разработчикам)]
[![Gem Version](https://badge.fury.io/rb/validates_russian.png)](http://badge.fury.io/rb/validates_russian)
[![Build Status](https://travis-ci.org/asiniy/validates_russian.png?branch=master)](https://travis-ci.org/asiniy/validates_russian)
[![Code Climate](https://codeclimate.com/github/asiniy/validates_russian.png)](https://codeclimate.com/github/asiniy/validates_russian)

Валидация русских значений:

* [ИНН](http://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика)
* ОКПО (TODO)
* ОКАТО (TODO)
* [КПП](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт)
* ОГРН (TODO)
* Корреспондентский счёт (TODO)
* Рассчётный счёт (TODO)

## Установка

Добавь в Gemfile

    gem 'validates_russian'

## Использование

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
