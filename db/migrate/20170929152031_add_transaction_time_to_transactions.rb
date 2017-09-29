class AddTransactionTimeToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :transacted_at, :datetime

  end
end
