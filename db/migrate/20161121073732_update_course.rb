class UpdateCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :teacherid, :teacher_id
  end
end
