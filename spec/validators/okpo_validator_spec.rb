require 'spec_helper'

describe OkpoValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, okpo: true)
  end

  it 'should be valid for valid values' do
    valid_okpos =  %w{
       57972160
       13410254
       0060621966
    }

    valid_okpos.each do |okpo|
      model = TestModel.new
      model.field = okpo
      model.should be_valid
    end
  end

  it 'should not be valid for invalid values' do
    valid_okpos =  %w{
       57972163
       579721634
       secret
       78fffffff
    }.push('', ' ', nil, [], {})

    valid_okpos.each do |okpo|
      model = TestModel.new
      model.field = okpo
      model.should_not be_valid
    end
  end
end
