require 'spec_helper'

describe ChineseKeywordFilter do
  before(:each) do
    @validator=KeywordFilter.new({:attributes=>{}})
    @mock=double('model')
    @mock.stub('errors').and_return([])
    @mock.errors.stub('[]').and_return({})
    @mock.errors[].stub('<<')
  end
  context 'validate_each'   do
      it 'should do nothing' do

        @mock.should_not_receive('errors')
        @validator.validate_each(@mock,'post',"中国人民站起来了")
      end

      it 'should add an error' do

        @mock.errors[].should_receive("<<")
        @validator.validate_each(@mock,'post',"习近平说：中国人民站起来来")
      end
  end
end