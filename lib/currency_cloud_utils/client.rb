module CurrencyCloudUtils
  class Client
    def initialize
      CurrencyCloud.login_id = Rails.application.secrets.currency_cloud_login_id
      CurrencyCloud.api_key = Rails.application.secrets.currency_cloud_api_key
      CurrencyCloud.environment = :demonstration
    end

    def currencies
      CurrencyCloud::Reference.currencies
    end
    
    def balances
      CurrencyCloud::Balance.find
    end
  end
end
