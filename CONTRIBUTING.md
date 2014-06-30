#Инструкции разработчикам

Валидатор копируется с класса `ValidatesRussian::Validator`, а дальше используется блок `validates_using`. В том случае, если значение не должно подходить по условиям, то используется `next false condition`:

```ruby
class BiggerThanTwoValidator < ValidatesRussian::Validator # Больше двух
  validates_using do |number|
    next false unless number.to_i > 2
  end
end
```

Существует список номеров регионов, доступный под `ValidatesRussian::REGION_NUMBERS`. Его **нужно** использовать для подтверждения номеров регионов, например ИНН:

```ruby
print ValidatesRussian::REGION_NUMBERS # => ["01", "03", "04", "05", "07", "08", "10", "11", "11", "12", "14", "15", "17", "18", "19", "20", "22", "24", "25", "26", "27", "28", "29", "30", "32", "33", "34", "36", "37", "38", "40", "41", "42", "44", "45", "46", "47", "49", "50", "52", "53", "56", "57", "57", "58", "60", "61", "63", "64", "65", "66", "68", "69", "70", "71", "71", "71", "73", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"]

class InnValidator < ValidatesRussian::Validator
  validates_using do |inn|
    ...
    next false unless ValidatesRussian::REGION_NUMBERS.include?(inn[0..1]) # станет невалидным, если нет кода региона РФ
    ...
  end
end
```

Если хочешь удостовериться, что в строке только цифры, используй

``` ruby
  next false unless kpp =~ /^\d+$/
```

### Если есть желание помочь,
то пиши любой код. Сообщество поможет.

### Несколько полезных ссылок:

1. http://dplabs.ru/blog/2009/jun/21/innkpp-code-decode/
2. https://github.com/melervand/tax-info-validation
