class Transaction < ApplicationRecord
  belongs_to :bank_account

  validates :amount, presence: true
  validates :description, presence: true
  validates :uid, presence: true, uniqueness: { scope: :bank_account}

  def self.sync(params)
    transaction = Transaction.where(bank_account_id: params[:bank_account_id], uid: params[:uid]).first_or_initialize
    transaction.assign_attributes(
      description: params[:description],
      amount: params[:amount],
      currency: params[:currency],
      balance: params[:balance],
      source: params[:source],
      transacted_at: params[:transacted_at]
    )
    transaction.save! if transaction.new_record? || transaction.changed?
    transaction
  end
end
