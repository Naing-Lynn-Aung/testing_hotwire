class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.date :start
      t.date :end
      t.integer :vote, default: 0

      t.timestamps
    end
  end
end
