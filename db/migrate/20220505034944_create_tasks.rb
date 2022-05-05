class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :location
      t.text :notes
      t.integer :category_id

      t.timestamps
    end
  end
end
