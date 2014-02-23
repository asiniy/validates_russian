class SnilsFormatValidator < ValidatesRussian::Validator
  validates_using do |snils|
    next false unless snils =~ /^\d+$/

    case snils.size
    when 11 then next false unless calc(snils) == snils[-2..-1]
    when 9 then next false unless snils.to_i <= 1001998
    else next false
    end
  end

  private

  def self.calc(snils)
    snils = snils.split(//).map(&:to_i)
    code = snils[0..-3].each_with_index
             .inject(0){ |s, p| s + p[0] * (9 - p[1]) } % 101 % 100
    code = (code < 10 ? code = '0' + code.to_s : code.to_s)
  end
end
