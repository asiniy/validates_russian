require 'spec_helper'

describe OkatoFormatValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, okato_format: true)
  end

  it 'should be valid for valid values' do
    valid_okatos =  %w{
       794038
       457892
       729267
       729255
    }

    valid_okatos.each do |okato|
      model = TestModel.new
      model.field = okato
      model.should be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_okatos =  %w{
       794033
       794032
       77150100
       78fffffff
    }.push('', ' ', nil, [], {})

    invalid_okatos.each do |okato|
      model = TestModel.new
      model.field = okato
      model.should_not be_valid
    end
  end
end