module Atozauth
  module Registration
    class ValidatePhone < Atozauth::Base
      def send
        a = self
        a.endpoint_path = "/v1/account/phone"
        a.post_deliver
      end
    end
  end
end
