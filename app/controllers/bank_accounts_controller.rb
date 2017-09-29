class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard/main'

  def connect
  end

  def index
    @bank_accounts = current_user.bank_accounts
  end

  def show
  end
end
