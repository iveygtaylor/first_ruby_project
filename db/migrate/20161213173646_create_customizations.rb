class CreateCustomizations < ActiveRecord::Migration[5.0]
  def change
    create_table :customizations do |t|
      t.string :avatar
      t.integer :connections

      t.timestamps
    end
  end
end
