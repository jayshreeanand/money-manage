class TruelayerController < ApplicationController
  before_action :authenticate_user!

  def callback
    code = request.params['code']
    client = TruelayerUtils::Client.new(nil, true)
    access_token = client.fetch_access_token(code)

    bank_id = TruelayerUtils::Client.new(access_token).bank_id
    bank_account = current_user.bank_accounts.where(name: bank_id, kind: :truelayer).first_or_initialize
    bank_account.uid = access_token
    bank_account.save!
    bank_account.sync_account_info
    redirect_to bank_accounts_path
  end

  def access_token_callback
  end

  def authenticate
    client = TruelayerUtils::Client.new
    redirect_to client.authenticate_url
  end

end
