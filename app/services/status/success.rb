# app/services/status/success.rb
module Status
  class Success < Status::Response
    def success?
      true
    end

    def error?
      false
    end
  end
end
