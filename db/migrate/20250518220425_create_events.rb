class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title, null:false
      t.text :description
      t.text :location
      t.datetime :start_time, null:false
      t.datetime :end_time
      t.boolean :is_work, null:false
      t.references :user, null:false
      t.timestamps
    end
  end
end
