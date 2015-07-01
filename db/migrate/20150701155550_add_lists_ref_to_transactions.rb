class AddListsRefToTransactions < ActiveRecord::Migration
  def change
    add_reference :transactions, :list, index: true, foreign_key: true
  end
end
