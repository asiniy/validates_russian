class InnFormatValidator < ValidatesRussian::Validator
  validates_using do |inn|
    next false unless ValidatesRussian::REGION_NUMBERS.include?(inn[0..1])
    next false unless inn =~ /^\d+$/
    next false if inn.size != 10 && inn.size != 12

    inn = inn.split(//).map(&:to_i)

    if inn.size == 10
      n10 = calc(P10, inn)
      next false unless n10 == inn[9]
    end

    if inn.size == 12
      n11 = calc(P11, inn)
      n12 = calc(P12, inn)
      next false unless n11 == inn[10] && n12 == inn[11]
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
