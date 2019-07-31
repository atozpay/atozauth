module Atozauth
  class Configuration
    attr_accessor :app_id, :app_secret, :app_client_key, :end_point
    def initialize
      @app_id = nil
      @app_secret = nil
      @app_client_key = nil
      @end_point = nil
    end
  end
end
