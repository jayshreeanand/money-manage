class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :bank_account, index: true
      t.float :amount
      t.float :balance
      t.integer :kind
      t.text :description
      t.string :currency
      t.string :uid
      t.string :source
      t.timestamps
    end
  end
end
