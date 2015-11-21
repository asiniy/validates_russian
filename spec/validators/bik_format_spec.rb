require 'spec_helper'

describe BikFormatValidator do
  before(:all) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, bik_format: true)
  end

  it 'should be valid for valid values' do
    valid_biks = %w{
      044525957
      044525225
      044030811
      042520849
      044525593
      044652323
      044525202
      049205770
    }

    valid_biks.each do |bik|
      expect(TestModel.new(field: bik)).to be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_biks = %w(
      04452595
      040205770
      549205770
      #ffff
      orange-duck
      eee
      xxx
      epics
      1234567890
      123456789101
    ).push('', ' ', nil)

    invalid_biks.each do |bik|
      expect(TestModel.new(field: bik)).to_not be_valid
    end
  end
end
