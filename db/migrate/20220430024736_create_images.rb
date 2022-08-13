class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :event_id
      t.string :url
      t.timestamps
    end
  end
end
