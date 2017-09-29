class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.text :description
      t.integer :kind
      t.datetime :remind_at
      t.timestamps
    end
  end
end
