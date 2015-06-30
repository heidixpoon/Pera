class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :item
      t.decimal :amount
    end
  end
end
