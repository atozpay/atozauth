module Atozauth
  module Registration
    class ValidateOtp < Atozauth::Base
      def send
        a = self
        a.endpoint_path = "/v1/account/otp"
        a.post_deliver
      end
    end
  end
end
