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

    def account_number
      @starling_client.account.get.number
    end

    def account_balance
      @starling_client.account_balance.get
    end

    def transactions
      results = @starling_client.transactions.list
      response = []
      results.each do |result|
        response << { uid: result.id, amount: result.amount, currency: result.currency, description: result.narrative, balance: JSON.parse(result.to_json)['parsed_data']['balance'], source: result.source }
      end
      # @parsed_data={"_links"=>{"detail"=>{"href"=>"api/v1/transactions/mastercard/454e8757-1a81-4b28-b174-8a8a5d92d923", "templated"=>false}}, "id"=>"454e8757-1a81-4b28-b174-8a8a5d92d923", "currency"=>"GBP", "amount"=>-29.7, "direction"=>"OUTBOUND", "created"=>"2017-09-29T13:47:36.725Z", "narrative"=>"Sofitel", "source"=>"MASTER_CARD", "balance"=>4217.86}>
      response
    end

    def account_info
      balance = account_balance
      { 
        account_number: account_number,
        currency: balance.currency,
        available_balance: balance.available_to_spend,
        cleared_balance: balance.cleared_balance,
        pending: balance.pending_transactions,
      }
    end
  end
end
