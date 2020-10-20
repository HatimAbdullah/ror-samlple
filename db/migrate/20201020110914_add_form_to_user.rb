class AddFormToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_number, :string
    add_column :users, :gender, :string
    add_column :users, :cv, :binary
  end
end
