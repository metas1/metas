class AddMoreDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :skills, :text
  end
end
