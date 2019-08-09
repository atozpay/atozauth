module Atozauth
  class Base
    attr_accessor :url, :params, :endpoint_path, :token

    def initialize(**args)
      @token = args[:token]
      @params = args.except!(:url, :token)
      @app_id = Atozauth.configuration.app_id
      @app_secret = Atozauth.configuration.app_secret
      @app_client_key = Atozauth.configuration.app_client_key
    end

    def post_deliver
      uri               = URI.parse(atoz_url)
      req               = Net::HTTP::Post.new(uri.path)
      req["AppId"]      = @app_id
      req["AppSecret"]  = @app_secret
      req["ClientKey"]  = @app_client_key
      req["Token"]      = @token if @token.present?
      req.body = @params.to_json
      con               = Net::HTTP.new(uri.host, uri.port)
      con.use_ssl       = false
      req["Content-Type"] = "application/json"
      response          = con.start {|http| http.request(req)}
      res_body = JSON.parse(response.body)
      data = res_body['meta']
      data.merge!(res_body['data'])
      data_response = Atozauth::Response.new(data)
      return data_response
    end

    def delete_deliver
      uri               = URI.parse(atoz_url)
      req               = Net::HTTP::Delete.new(uri.path)
      req["AppId"]      = @app_id
      req["AppSecret"]  = @app_secret
      req["ClientKey"]  = @app_client_key
      req["Token"]      = @token if @token.present?
      con               = Net::HTTP.new(uri.host, uri.port)
      con.use_ssl       = false
      req["Content-Type"] = "application/json"
      response          = con.start {|http| http.request(req)}
      res_body = JSON.parse(response.body)
      data = res_body['meta']
      data.merge!(res_body['data'])
      data_response = Atozauth::Response.new(data)
    end


    def atoz_url
      @url = ["http://", Atozauth.configuration.end_point, self.endpoint_path].join
    end
  end
end
