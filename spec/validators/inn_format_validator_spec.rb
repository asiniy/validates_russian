require 'spec_helper'

describe InnFormatValidator do
  before(:all) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, inn_format: true)
  end

  it 'should be valid for valid values' do
    valid_inns = %w{
      183501166447
      341800950695
      470313747100
      471900124013
      503102384852
      0274062111
      7706633181
      7715805253
      7714698320
      7830002293
      5036032527
    }

    valid_inns.each do |inn|
      expect(TestModel.new(field: inn)).to be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_inns = %w(
      #ffff
      orange-duck
      eee
      xxx
      epics
      1234567890
      123456789101
    ).push('', ' ', nil)

    invalid_inns.each do |inn|
      expect(TestModel.new(field: inn)).to_not be_valid
    end
  end
end
