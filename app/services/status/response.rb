# app/services/status/response.rb
module Status
  class Response
    attr_accessor :response_data

    delegate :[], to: :response_data

    def initialize(agrs)
      @response_data = agrs
    end

    def success?
      raise NotImplementedError
    end

    def error?
      raise NotImplementedError
    end

    def method_missing(method_id, *args)
      return @response_data[$1.to_sym] = args[0] if /^(\w+)=$/ =~ method_id

      @response_data[method_id.to_sym]
    end
  end
end
