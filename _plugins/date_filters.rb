module Jekyll
  module Filters
    module DateFilters
      DATE_RE = /\A\d{4}-\d\d-\d\d \d\d:\d\d:\d\d [+-]\d{4}\z/

      def date_to_xmlschema(date)
        date = date.to_s if date.is_a? Time
        raise TypeError unless date.is_a? String
        raise 'Invalid format' unless date =~ DATE_RE

        Time.parse(date).to_time.localtime.xmlschema
      end
    end
  end
end
