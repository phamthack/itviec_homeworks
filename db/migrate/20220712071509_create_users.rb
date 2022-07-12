class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :status, index: true
      t.string :city, index: true
      t.integer :subscribe_status

      t.timestamps
    end
  end
end
