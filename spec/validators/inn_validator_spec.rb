require 'spec_helper'

describe InnValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, inn: true)
  end

  it 'should be valid for valid values' do
    valid_inns = %w{
      183501166447
      341800950695
      470313747100
      471900124013
      503102384852
      7706633181
      7715805253
      7714698320
      7830002293
      5036032527
    }

    valid_inns.each do |inn|
      model = TestModel.new
      model.field = inn
      model.should be_valid
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
      model = TestModel.new
      model.field = inn
      model.should_not be_valid
    end
  end
end
