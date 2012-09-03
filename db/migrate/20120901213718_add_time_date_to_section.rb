class AddTimeDateToSection < ActiveRecord::Migration
  def change
    add_column :sections, :date, :date
    add_column :sections, :time, :time
  end
end
