# app/services/status/error.rb
module Status
  class Error < Status::Response
    def success?
      false
    end

    def error?
      true
    end
  end
end
