class TransactionsController < ApplicationController
  layout 'dashboard/main'

  def index
    @transactions = current_user.transactions
  end
end
