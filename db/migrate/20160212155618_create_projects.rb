class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :url
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
