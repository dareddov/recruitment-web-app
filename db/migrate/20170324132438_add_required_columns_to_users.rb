class AddRequiredColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :integer
    add_column :users, :age, :integer
  end
end
