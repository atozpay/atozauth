module Atozauth
  module Auth
    class Session < Atozauth::Base
      def send
        a = self
        a.endpoint_path = "/v1/session"
        a.post_deliver
      end

      def delete
        a = self
        a.endpoint_path = "/v1/session"
        a.delete_deliver
      end
    end
  end
end
