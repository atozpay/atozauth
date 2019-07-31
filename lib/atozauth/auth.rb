module Atozauth
  class Auth < Atozauth::Base
    def session
      a = self
      a.endpoint_path = "/v1/session"
      a.post_deliver
    end
  end
end
