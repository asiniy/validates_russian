class OkpoFormatValidator < ValidatesRussian::Validator
  validates_using do |okpo|
    next false unless okpo =~ /^\d+$/

    okpo = okpo.split(//).map(&:to_i)

    next false unless okpo.size == 8 || okpo.size == 10
    next false unless calc(okpo) == okpo.last
  end

  private

  def self.calc(okpo)
    okpo[0..-2].each_with_index.inject(0){ |s, p| s + p[0] * (p[1] + 1) } % 11
  end
end
