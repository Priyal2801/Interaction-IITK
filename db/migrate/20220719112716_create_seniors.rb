class CreateSeniors < ActiveRecord::Migration[6.0]
  def change
    create_table :seniors do |t|
      t.string :name
      t.string :email
      t.string :branch
      t.string :linkedIN
      t.string :tags, array: true, :default => []
      t.timestamps
    end
  end
end
