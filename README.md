# Atozauth

This gem for Atozauth API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'atozauth'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install atozauth

## Install Configuration

    $ rails g atozauth:install

this will generating file in config/initializer/Atozauth.rb and please set your configuration sso API

    Atozauth.configure do |config|
      #config.app_id = ENV['sso_app_id']
      #config.app_secret = ENV['sso_app_secret']
      #config.app_client_key = ENV['sso_client_key']
      #config.end_point = ENV['sso_endpoint']
    end

## Usage

send data to api for validate phone number

    validate_phone = Atozauth::Registration::ValidatePhone.new(phone: "087823290601")
    response = validate_phone.send
    puts response
    `#<Atozauth::Response:0x007f99a5ee7b18 @code=200, @messages=["berhasil."], @phone="087823290601"> `

validate otp

    validate_otp = Atozauth::Registration::ValidateOtp.new(phone: "087823290601", otp: "1234")
    response = validate_otp.send
    puts response
    `#<Atozauth::Response:0x007ff52b5c85c8 @code=402, @messages=["Phone number atau register code tidak valid."]>
`


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/atoz-sso.
