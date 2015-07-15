require 'spec_helper'

describe OkpoFormatValidator do
  before(:all) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, okpo_format: true)
  end

  it 'should be valid for valid values' do
    valid_okpos = %w{
      57972160
      13410254
      74917277
      00002810
      99874891
      75249303
      99874891
      0060621966
      0174266916
    }

    valid_okpos.each do |okpo|
      expect(TestModel.new(field: okpo)).to be_valid
    end
  end

  it 'should not be valid for invalid values' do
    valid_okpos = %w{
      57972163
      579721634
      secret
      78fffffff
    }.push('', ' ', nil, [], {})

    valid_okpos.each do |okpo|
      expect(TestModel.new(field: okpo)).to_not be_valid
    end
  end
end
