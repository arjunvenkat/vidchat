class ChangePrequisitesNameInCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :prequisites, :prerequisites
  end
end
