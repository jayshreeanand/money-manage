class BankAccount < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user }

  def sync
    client = TruelayerUtils::Client.new(uid)
    self.name = client.bank_id
    save!
  end

  def user_info
    client = TruelayerUtils::Client.new(uid)
  end
end
