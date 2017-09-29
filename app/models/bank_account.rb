class BankAccount < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user }
  validates :kind, presence: true

  enum kind: { truelayer: 0, starling: 1 }

  def client
    TruelayerUtils::Client.new(uid)
  end

  def user_info
    client.user_info
  end

  def accounts
    client.accounts
  end
end
