class InnFormatValidator < ValidatesRussian::Validator
  validates_using do |inn|
    next false unless ValidatesRussian::REGION_NUMBERS.include?(inn[0..1])
    next false unless inn =~ /^\d+$/

    inn = inn.split(//).map(&:to_i)

    case inn.size
    when 10 then next false unless calc(P10, inn) == inn[9]
    when 12 then next false unless calc(P11, inn) == inn[10] && calc(P12, inn) == inn[11]
    else next false
    end
  end

  private

  def self.calc(p, inn)
    p.each_with_index.inject(0){ |s, p| s + p[0] * inn[p[1]] } % 11 % 10
  end

  P10 = [2, 4, 10, 3, 5, 9, 4, 6, 8]
  P11 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  P12 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  private_constant :P10, :P11, :P12
end
