require 'spec_helper'

describe RsFormatValidator do
  before(:each) do
    TestModel.reset_callbacks(:validate)
    TestModel.validates(:field, rs_format: true)
  end

  it 'should be valid for valid values' do
    valid_rss =  %w{
       58187404448375647329
       77252937461205123501
       52534060468985601001
    }

    valid_rss.each do |rs|
      model = TestModel.new
      model.field = rs
      model.should be_valid
    end
  end

  it 'should not be valid for invalid values' do
    invalid_rss =  %w{
       77150100
       gsDASsda
       lol
       52531406168985601001
       7725234016120512350
    }.push('', ' ', nil, [], {})

    invalid_rss.each do |rs|
      model = TestModel.new
      model.field = rs
      model.should_not be_valid
    end
  end
end