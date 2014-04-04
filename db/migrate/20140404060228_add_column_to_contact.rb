class AddColumnToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :string
  end
end
