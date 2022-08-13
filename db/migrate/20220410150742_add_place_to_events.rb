class AddPlaceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :place, :string
    add_column :events, :begin, :date
    add_column :events, :end, :date
    add_column :events, :begintime, :time
    add_column :events, :endtime, :time
    add_column :events, :otherdate, :date
    add_column :events, :telephone, :string
    add_column :events, :email, :string
    add_column :events, :other, :string
    add_column :events, :tarifs, :string
    add_column :events, :complementtarifs, :string
    create_table :eventhavephotos do |t|
      t.integer :event_id
      t.integer :photo_id
    end
    create_table :photos do |y|
      y.integer :name
      y.timestamps
      end
  end
end
