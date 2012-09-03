class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :user_id
      t.integer :category_id
      t.text :description
      t.string :objectives
      t.string :prerequisites
      t.string :image_url

      t.timestamps
    end
  end
end
