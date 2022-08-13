class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :prenom
      t.string :nom
      t.string :email
      t.string :telephone
      t.string :adresse
      t.string :zip
      t.string :city
      t.string :country
      t.string :message_type
      t.text :content
      t.boolean :receiveupdate

      t.timestamps
    end
  end
end
