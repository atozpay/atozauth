require "atozauth/version"
require "atozauth/configuration"
require "rails"
module Atozauth
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

require "atozauth/base"
require "atozauth/auth/session"
require "atozauth/response"
require "atozauth/registration/validate_otp"
require "atozauth/registration/validate_phone"
