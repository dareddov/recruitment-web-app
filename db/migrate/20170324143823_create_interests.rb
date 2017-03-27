class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :name
      t.integer :interest_type
      t.references :user

      t.timestamps
    end
  end
end
