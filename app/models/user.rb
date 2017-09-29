class User < ApplicationRecord
  has_many :bank_accounts, dependent: :destroy
  has_many :transactions, through: :bank_accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
