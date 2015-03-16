class AddBuyIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :buy_id, :intger
  end
end
