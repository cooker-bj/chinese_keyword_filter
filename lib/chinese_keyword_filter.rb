require "chinese_keyword_filter/version"
require "active_record"
module ChineseKeywordFilter
  class KeywordFilterValidator < ActiveModel::EachValidator
    def initialize(options)
      @data=[]
      data_path="#{File.dirname(File.expand_path(__FILE__))}/#{ChineseKeywordFilter::NAME}/word.dat"
       add_filter_data(data_path)

      if defined? Rails
        custom_path="#{Rails.root}/config/custom_filter.dat"
        add_filter_data(custom_path)
      end
      super

    end

    def validate_each(object,attribute,value)
         @data.each do |key|
           object.errors[attribute]<< (options[:message]||"请不要使用敏感词" ) if value=~/#{key}/
         end

    end
    private
      def add_filter_data(path)
        File.open(path,'r') do |f|
          f.each_line do |line|
            @data<<line.chop unless line.chop.empty?
          end
        end
      end


  end
end

include ChineseKeywordFilter
