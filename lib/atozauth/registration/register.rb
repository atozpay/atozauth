module Atozauth
  module Registration
    class Register < Atozauth::Base
      def send
        a = self
        a.endpoint_path = "/v1/account"
        a.post_deliver
      end
    end
  end
end
