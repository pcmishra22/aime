class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :topic,null: false
      t.date :startdate,null: false
      t.date :enddate,null: false
      t.time :starttime,null: false
      t.time :endtime,null: false
      t.timestamps null: false
    end
    add_reference :schedules,:course,index:true,foreign_key:true,after:"topic"
  end
end
