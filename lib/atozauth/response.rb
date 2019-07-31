module Atozauth
  class Response
    def initialize(args)
      args.each do |attribute_name, attribute_value|
        self.class.send(:define_method, "#{attribute_name}=".to_sym) do |value|
          instance_variable_set("@" + attribute_name.to_s, value)
        end

        self.class.send(:define_method, attribute_name.to_sym) do
          instance_variable_get("@" + attribute_name.to_s)
        end

        self.send("#{attribute_name}=".to_sym, attribute_value)
      end
    end

    def success?
      resp = false
      resp = true if self.code.to_i == 200
      return resp
    rescue
      return false
    end
  end
end
