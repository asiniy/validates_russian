require 'spec_helper'

describe OkpoFormatValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, okpo_format: true)
  end

  it 'should be valid for valid values' do
    valid_okpos =  %w{
       57972160
       13410254
       0060621966
       02372510
    }

    valid_okpos.each do |okpo|
      model = TestModel.new
      model.field = okpo
      puts okpo
      model.should be_valid
    end
  end

#  it 'should not be valid for invalid values' do
#    invalid_okpos =  %w{
#       57972163
#       579721634
#       secret
#       78fffffff
#    }.push('', ' ', nil, [], {})

#    invalid_okpos.each do |okpo|
#      model = TestModel.new
#      model.field = okpo
#      model.should_not be_valid
#    end
#  end
end
