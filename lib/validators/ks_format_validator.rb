class KsFormatValidator < ValidatesRussian::Validator
  # see format here: http://ru.wikipedia.org/wiki/Корреспондентский_счёт
  validates_using do |ks|
    next false unless ks.size == 20
    next false unless ks =~ /^\d+$/
    next false unless ks[0..2] == '301'
  end
end