class SnilsFormatValidator < ValidatesRussian::Validator
  # see format here: http://ru.wikipedia.org/wiki/Страховой_номер_индивидуального_лицевого_счёта
  validates_using do |snils|
    next false unless snils =~ /^\d+$/

    if (snils.size == 11)
      next false unless calc(snils.split(//).map(&:to_i)) == snils[-2..-1]
    elsif (snils.size == 9)
      next false unless snils.to_i <= 1001998
    else
      next false
    end  
  end
  
  private

  def self.calc(snils)
    sum = snils[0..-3].each_with_index.inject(0){ |s, p| s + p[0] * (9 - p[1]) }
    code = case sum
           when 0...100 then sum
           when 100..101 then 0
           when proc { |n| n > 101 } then sum % 101
           end
    if code < 10 then code = '0' + code.to_s else code.to_s end
  end
end