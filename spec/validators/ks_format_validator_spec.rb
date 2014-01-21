require 'spec_helper'

describe KsFormatValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, ks_format: true)
  end

  it 'should be valid for valid values' do
    valid_kss =  %w{
       30101810642400000957
       30106772134600000957
       30143788710000000057
    }

    valid_kss.each do |ks|
      model = TestModel.new
      model.field = ks
      model.should be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_kss =  %w{
       77150100
       78fffffff
       3010181064240000095
       31101810642400000957
    }.push('', ' ', nil, [], {})

    invalid_kss.each do |ks|
      model = TestModel.new
      model.field = ks
      model.should_not be_valid
    end
  end
end