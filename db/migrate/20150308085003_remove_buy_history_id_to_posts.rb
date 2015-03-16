class RemoveBuyHistoryIdToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :buy_history_id
  end

  def down
    add_column :posts, :buy_history_id, :intger
  end
end
