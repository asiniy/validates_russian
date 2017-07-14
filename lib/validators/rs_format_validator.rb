class RsFormatValidator < ValidatesRussian::Validator
  # see format here: http://ru.wikipedia.org/wiki/Расчётный_счёт
  validates_using do |rs|
    next false unless rs.size == 20 || rs.size == 25
    next false unless ValidatesRussian::OKV.include?(rs[5..7])
    next false unless rs =~ /^\d+$/
  end
end
