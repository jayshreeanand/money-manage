class BankAccount < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user }

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
