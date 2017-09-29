class BankAccount < ApplicationRecord
  belongs_to :user

  serialize :meta_info
  validates :name, uniqueness: { scope: :user }
  validates :kind, presence: true

  enum kind: { truelayer: 0, starling: 1 }

  def client
    if truelayer?
      TruelayerUtils::Client.new(uid)
    elsif starling?
      StarlingBankUtils::Client.new(uid)
    end
  end

  def sync_account_info
    self.meta_info = client.account_info 
    save!
  end

  def user_info
    client.user_info
  end

  def accounts
    client.accounts
  end
end
