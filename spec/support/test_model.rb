class TestModel
  include ActiveModel::Validations

  attr_accessor :field

  def initialize(options = {})
    options.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end
