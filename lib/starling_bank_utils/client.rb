module StarlingBankUtils
  class Client
    def initialize
      @starling_client = Starling::Client.new(
        access_token: Rails.application.secrets.starling_access_token,
        environment: :sandbox,
      )
    end
  end
end
