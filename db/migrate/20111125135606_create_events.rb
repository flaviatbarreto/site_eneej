class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.references :user
      t.date :start_date
      t.date :end_date
      t.string :address
      t.string :city
      t.integer :max_subscribers

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
