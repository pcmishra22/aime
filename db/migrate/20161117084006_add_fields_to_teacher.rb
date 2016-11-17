class AddFieldsToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
    add_column :teachers, :profile_photo_url, :string
  end
end
