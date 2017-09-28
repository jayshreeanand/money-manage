require 'faraday'
require 'faraday_middleware'

module TruelayerUtils
  class Client
    BASE_URI = 'https://api.truelayer.com'

    def initialize
      @base_connection = Faraday.new do |faraday|
        faraday.url_prefix = BASE_URI
        faraday.request :json
        faraday.response :raise_error
        faraday.response :logger, ::Logger.new(STDOUT), bodies: true
        faraday.response :follow_redirects
        faraday.response :logger
      end
    end

    def execute(method, url, body=nil, header=false, is_url_encoded=false, url_prefix=false)
      begin
        connection = @base_connection.dup
        if url_prefix
          connection.url_prefix = url_prefix
        end

        if is_url_encoded
          connection.request :url_encoded
        end
        uri = URI.parse(URI.encode(url))
        connection.adapter Faraday.default_adapter
        connection.run_request(method, uri, body, header)

      rescue Faraday::ClientError => e
        raise e
      end
    end

    def authenticate_url
      params = { client_id: Rails.application.secrets.truelayer_client_id, response_type: 'code', enable_mock: true, nonce: SecureRandom.hex, redirect_uri: 'http://localhost:3000/callback', scope: 'info accounts balance transactions cards' }
      'https://auth.truelayer.com/?' + params.to_query
    end
  end
end
