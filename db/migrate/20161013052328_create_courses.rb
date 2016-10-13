class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacherid,:index=>true,null: false
      t.boolean :status,:default=>true,null: false

      t.timestamps null: false
    end
  end
end
