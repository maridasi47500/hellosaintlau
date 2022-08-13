class CreateCard < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :img
      t.string :name
      t.string :email
      t.string :femail
      t.text :message
      t.boolean :scopy
    end
  end
end
