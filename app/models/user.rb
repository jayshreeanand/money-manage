class User < ApplicationRecord
  has_many :bank_accounts, dependent: :destroy
  has_many :transactions, through: :bank_accounts
  has_many :receipts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
