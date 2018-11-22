module Jekyll
  module Filters
    module DateFilters
      DATE_RE = /\A\d{4}-\d\d-\d\d \d\d:\d\d:\d\d [+-]\d{4}\z/

      def date_to_xmlschema(value)
        value = value.to_s if value.is_a? Time
        raise TypeError unless value.is_a? String
        raise 'Invalid format' unless value =~ DATE_RE

        Time.parse(value).to_time.localtime.xmlschema
      end
    end
  end
end
