class OkpoFormatValidator < ValidatesRussian::Validator
  validates_using do |okpo|
    next false unless okpo =~ /^\d+$/

    okpo = okpo.split(//).map(&:to_i)

    next false unless okpo.size == 8 || okpo.size == 10
    next false unless calc(okpo) == okpo.last
  end

  private

  def self.calc(okpo)
    nums = okpo[0..-2]
    check_digit = weight(nums, 1) % 11
    check_digit = weight(nums, 3) % 11 if check_digit == 10
    check_digit == 10 ? 0 : check_digit
  end

  def self.weight(nums, shift)
    nums.each_with_index.inject(0) { |a, e| a + e[0] * calc_weight(e[1] + shift) }
  end

  def self.calc_weight(num)
    num == 11 ? 1 : num
  end
end
