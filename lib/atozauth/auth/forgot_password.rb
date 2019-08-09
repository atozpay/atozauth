module Atozauth
  module Auth
    class ForgotPassword < Atozauth::Base
      def send
        a = self
        a.endpoint_path = "/v1/password/forgot"
        a.post_deliver
      end
    end
  end
end
