class CreateCourierPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :courier_packages do |t|
      t.references :courier, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
