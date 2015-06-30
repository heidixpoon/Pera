class CreateMonthlyLists < ActiveRecord::Migration
  def change
    create_table :monthly_lists do |t|
      t.string :name
    end
  end
end
