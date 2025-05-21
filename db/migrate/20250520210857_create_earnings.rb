class CreateEarnings < ActiveRecord::Migration[8.0]
  def change
    create_table :earnings do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :amount, null: false
      t.string :category, null:false
      t.references :event, null:false
      t.timestamps
    end
  end
end
