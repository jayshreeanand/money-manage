require 'starling'

module StarlingBankUtils
  class Client
    def initialize(oauth_token=nil)
      @starling_client = Starling::Client.new(
        access_token: oauth_token,
        environment: :sandbox,
      )
    end

    def authenticate_url
      params = { client_id: Rails.application.secrets.starling_client_id, response_type: 'code', state: SecureRandom.hex, redirect_uri: 'http://localhost:3000/starling_bank/callback' }
      'https://oauth-sandbox.starlingbank.com/?' + params.to_query
    end

    def fetch_access_token(code)
     
    end

    def account_balance
      @starling_client.account_balance.get
    end

    def transactions
      @starling_client.transactions.list
    end
  end
end
