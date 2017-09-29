class TransactionsController < ApplicationController
  layout 'dashboard/main'

  def index
    @transactions = current_user.transactions
  end

  def spends
    @bank_accounts = current_user.bank_accounts
    @transactions = current_user.transactions
    @chart_data = @bank_accounts.first.transactions.group(:transacted_at).sum(:amount)
  end
end
