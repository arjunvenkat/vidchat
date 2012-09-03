class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :prerequisites
      t.references :user_id
      t.string :image_url
      t.integer :category_id

      t.timestamps
    end
    add_index :courses, :user_id_id
  end
end
