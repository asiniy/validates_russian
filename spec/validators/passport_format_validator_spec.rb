require 'spec_helper'

describe PassportFormatValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, passport_format: true)
  end

  it 'should be valid for valid values' do
    valid_passports =  %w{
      6184729864
      4023841230
      0110019981
      5710019971
    }

    valid_passports.each do |passport|
      model = TestModel.new
      model.field = passport
      model.should be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_passports =  %w{
      1
      231
      77150100
      78fffffff
    }.push('', ' ', nil, [], {})

    invalid_passports.each do |passport|
      model = TestModel.new
      model.field = passport
      model.should_not be_valid
    end
  end
end