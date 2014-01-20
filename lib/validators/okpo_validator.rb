class OkpoValidator < ValidatesRussian::Validator
  validates_using do |okpo|
    next false unless okpo.length == 8 || okpo.length == 10
    next false unless okpo =~ /^\d+$/
    next false unless calc(okpo) == okpo[-1, 1].to_i
  end

  private

    def self.calc(okpo)
      sum = 0
      okpo[0..-2].length.times{|i| sum += okpo[i].to_i*(i+1)}
      sum % 11
    end

end
