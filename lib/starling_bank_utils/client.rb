require 'starling'

module StarlingBankUtils
  class Client
    def initialize
      @starling_client = Starling::Client.new(
        access_token: Rails.application.secrets.starling_access_token,
        environment: :sandbox,
      )
    end

    def account_balance
      @starling_client.account_balance.get
    end
  end
end
