class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard/main'

  def index
    @bank_accounts = current_user.bank_accounts
  end
end
