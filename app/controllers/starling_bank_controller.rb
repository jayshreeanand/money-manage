class StarlingBankController < ApplicationController
  before_action :authenticate_user!

  def callback
    code = request.params['code']
    client = TruelayerUtils::Client.new(nil, true) #use same truelayer code exchange for starling
    # access_token = client.fetch_starling_access_token(code)
    # access_token = 'test'

    bank_account = current_user.bank_accounts.where(name: 'starling', kind: :starling).first_or_initialize
    # bank_account.uid = access_token
    bank_account.save!
    redirect_to bank_accounts_path
  end


  def authenticate
    client = StarlingBankUtils::Client.new
    redirect_to client.authenticate_url
  end
end
