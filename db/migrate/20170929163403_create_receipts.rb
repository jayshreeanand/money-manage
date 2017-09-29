class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.belongs_to :transaction
      t.string :document_image
      t.text :notes
      t.timestamps
    end
  end
end
