class TruelayerController < ApplicationController
  before_action :authenticate_user!

  def callback
    code = request.params['code']
    client = TruelayerUtils::Client.new(true)
    access_token = client.fetch_access_token(current_user, code)
    current_user.bank_accounts.create(uid: access_token, name: 'demo')
    redirect_to '/'
  end

  def access_token_callback
  end

  def authenticate
    client = TruelayerUtils::Client.new
    redirect_to client.authenticate_url
  end

end
