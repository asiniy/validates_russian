require 'spec_helper'

describe KppValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, kpp: true)
  end

  it 'should be valid for valid values' do
    valid_kpps =  %w{
       771501001
       772501001
       525601001
    }

    valid_kpps.each do |kpp|
      model = TestModel.new
      model.field = kpp
      model.should be_valid
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
      model = TestModel.new
      model.field = kpp
      model.should_not be_valid
    end
  end
end
