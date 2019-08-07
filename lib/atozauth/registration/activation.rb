module Atozauth
  module Registration
    class Activation < Atozauth::Base
      def send
        a = self
        a.endpoint_path = "/v1/account/activation"
        a.post_deliver
      end
    end
  end
end
