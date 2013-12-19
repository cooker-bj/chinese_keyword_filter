require "chinese_keyword_filter/version"
require "active_record"
module ChineseKeywordFilter
  class KeywordFilter < ActiveModel::EachValidator
    def initialize(options)
      @data=[]
      data_path="#{File.dirname(File.expand_path(__FILE__))}/#{ChineseKeywordFilter::NAME}/word.dat"
      File.open(data_path,'r') do |f|
        f.each_line do |line|
          @data<<line.chomp
        end
      end
      super
    end

    def validate_each(object,attribute,value)
         @data.each do |key|
          object.errors[attribute]<< (options[:message]||"请不要使用敏感词#{key}" )if value=~/#{key}/
         end

    end

  end
end
