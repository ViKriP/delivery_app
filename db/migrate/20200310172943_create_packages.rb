class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :tracking_number, null: false
      t.boolean :delivery_status, default: false

      t.timestamps
    end
  end
end
