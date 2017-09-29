class AddMetaInfoToBankAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :bank_accounts, :meta_info, :text

  end
end
