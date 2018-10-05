module Rulers
  class Controller

    require "erubis"

    attr_reader :env

    def initialize(env)                                @env = env
    end

    def render(view_name, locals)
      filename = File.join "app", "views",
        controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      variables_hash = {}
      variables = instance_variables
      variables = variables.each { |name| variables_hash[name] = instance_variable_get(name) }
      eruby.result locals.merge(env: env).merge(view_variables)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Rulers.to_underscore klass
    end

    private

    def view_variables
      variables_hash = {}
      variables = instance_variables
      variables.each { |name| variables_hash[name] = instance_variable_get(name) }
      variables_hash
    end
  end
end
