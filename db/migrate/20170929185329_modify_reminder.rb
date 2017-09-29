class ModifyReminder < ActiveRecord::Migration[5.0]
  def change
    add_reference :reminders, :user
    add_reference :reminders, :transaction
  end
end
