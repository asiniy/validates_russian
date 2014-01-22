require 'spec_helper'

describe OgrnFormatValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, ogrn_format: true)
  end

  it 'should be valid for valid values' do
    valid_ogrns =  %w{
       1025004701402
       1047796885861
       5077746887312
       1077604011935
    }

    valid_ogrns.each do |ogrn|
      model = TestModel.new
      model.field = ogrn
      model.should be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_ogrns =  %w{
       secret
       507774688731
       8934422763457
       1345345523664
    }.push('', ' ', nil, [], {})

    invalid_ogrns.each do |ogrn|
      model = TestModel.new
      model.field = ogrn
      model.should_not be_valid
    end
  end
end
