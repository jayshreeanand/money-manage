class Transaction < ApplicationRecord
  belongs_to :bank_account

  validates :bank_account, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates :uid, presence: true, uniqueness: { scope: :bank_account}

  def self.sync(params)
  end
end
