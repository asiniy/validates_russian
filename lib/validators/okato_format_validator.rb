class OkatoFormatValidator < ValidatesRussian::Validator
  # see format here: http://ru.wikipedia.org/wiki/Общероссийский_классификатор_объектов_административно-территориального_деления
  validates_using do |okato|
    next false unless okato =~ /^\d+$/

    okato = okato.split(//).map(&:to_i)

    next false unless [3, 6, 9].include?(okato.size)
    next false unless calc(okato) == okato.last
  end
  
  private

  def self.calc(okato)
    [1,3].each do |i|
      code = okato[0..-2].each_with_index.inject(0){ |s, p| s + p[0] * (p[1] + i) } % 11
      return code if code < 10
    end
    0
  end
end