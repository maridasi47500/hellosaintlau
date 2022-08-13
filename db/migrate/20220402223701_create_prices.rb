class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.string :name
      t.string :image
      t.string :url
      t.timestamps
    end
    create_table :hotels do |t|
      t.string :name
      t.string :image
      t.string :url
      t.timestamps
    end
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.string :url
      t.timestamps
    end
    create_table :events do |t|
      t.string :name
      t.string :image
      t.string :url
      t.text :description
      t.timestamps
    end
    create_table :locations do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :cuisines do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :payments do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :event_types do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :restaurant_types do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :hotel_types do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :restaurant_services do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :hotel_services do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
    create_table :hotelshaveprices do |t|
      t.integer :hotel_id
      t.integer :price_id
    end
    create_table :eventhaveeventtypes do |t|
      t.integer :event_id
      t.integer :event_type_id
    end
    create_table :restauranthavelocations do |t|
      t.integer :restaurant_id
      t.integer :location_id
    end
    create_table :hotelhavelocations do |t|
      t.integer :hotel_id
      t.integer :location_id
    end
    create_table :restauranthavepayments do |t|
      t.integer :payment_id
      t.integer :restaurant_id
    end
    create_table :restauranthaverestauranttypes do |t|
      t.integer :restaurant_type_id
      t.integer :restaurant_id
    end
    create_table :restauranthaverestaurantservices do |t|
      t.integer :restaurant_service_id
      t.integer :restaurant_id
    end
    create_table :restauranthavecuisines do |t|
      t.integer :cuisine_id
      t.integer :restaurant_id
    end
    create_table :hotelhavehoteltypes do |t|
      t.integer :hotel_type_id
      t.integer :hotel_id
    end
    create_table :hotelhavehotelservices do |t|
      t.integer :hotel_service_id
      t.integer :hotel_id
    end
    create_table :hotelhavepayments do |t|
      t.integer :payment_id
      t.integer :hotel_id
    end
  end
end
