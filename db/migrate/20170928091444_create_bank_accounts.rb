class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.belongs_to :user, index: true
      t.string :uid
      t.string :name
      t.integer :kind
      t.timestamps
    end
  end
end
