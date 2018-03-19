module RSpec
  module Rails
    module Swagger
      class RequestCaller
        
        def call(instance, method:, path:, body:, headers:, env:)
          if ::Rails::VERSION::MAJOR >= 5
            instance.send(method, path, {params: body, headers: headers, env: env})
          else
            instance.send(method, path, body, headers.merge(env))
          end
        end

      end
    end
  end
end
