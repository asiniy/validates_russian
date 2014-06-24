require 'spec_helper'

describe KppFormatValidator do
  before(:all) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, kpp_format: true)
  end

  it 'should be valid for valid values' do
    valid_kpps =  %w{
       771501001
       772501001
       525601001
    }

    valid_kpps.each do |kpp|
      expect(TestModel.new(field: kpp)).to be_valid
    end
  end

  it 'should not be valid for invalid values' do
    valid_kpps =  %w{
       77150100
       oss!
       secret
       001122333
       78fffffff
    }.push('', ' ', nil, [], {})

    valid_kpps.each do |kpp|
      expect(TestModel.new(field: kpp)).to_not be_valid
    end
  end
end
