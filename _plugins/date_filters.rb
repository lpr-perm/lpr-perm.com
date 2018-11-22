module Jekyll
  module Filters
    module DateFilters
      DATE_RE = /\A\d{4}-\d\d-\d\d \d\d:\d\d:\d\d [+-]\d{4}\z/

      def date_to_xmlschema(date)
        date = date.to_s if date.is_a? Time
        raise TypeError unless date.is_a? String
        raise 'Invalid format' unless date =~ DATE_RE

        custom_time(date).xmlschema
      end

    private

      def custom_time(input)
        date = custom_to_date input
        unless date.respond_to? :to_time
          raise Errors::InvalidDateError,
                "Invalid Date: '#{input.inspect}' is not a valid datetime."
        end
        date.to_time.dup.localtime
      end

      def custom_to_date(obj)
        return obj if obj.respond_to?(:strftime)

        if obj.is_a?(String)
          return nil if obj.empty?
          obj = obj.downcase
        end

        case obj
        when 'now'.freeze, 'today'.freeze
          Time.now
        when /\A\d+\z/, Integer
          Time.at(obj.to_i)
        when String
          Time.parse(obj)
        end
      rescue ::ArgumentError
        nil
      end
    end
  end
end
