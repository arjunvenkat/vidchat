class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :user_id
      t.string :session_id

      t.timestamps
    end
  end
end
