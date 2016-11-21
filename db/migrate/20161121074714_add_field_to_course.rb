class AddFieldToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :grade, :int4range
    add_column :courses, :subject_area, :string
    add_column :courses, :details, :string
  end
end
