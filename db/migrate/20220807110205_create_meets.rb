class CreateMeets < ActiveRecord::Migration[6.0]
  def change
    create_table :meets do |t|
      t.integer :user_id
      t.integer :senior_id

      t.timestamps
    end
  end
end
