class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :dob, :date, null: true
    add_column :users, :total_score, :integer, null: true
    add_column :users, :profile_photo, :string, null: true
    add_column :users, :languages, :string, null: true
    add_column :users, :activities, :string, null: true
    add_column :users, :videos, :string, null: true
    add_column :users, :favourite_class, :integer, null: true
    add_column :users, :study_groups, :string, null: true
    add_column :users, :awards, :string, null: true
    add_column :users, :twitter, :string, null: true
    add_column :users, :facebook, :string, null: true
    add_column :users, :instagram, :string, null: true
    add_column :users, :google, :string, null: true
    add_column :users, :pininterest, :string, null: true
    add_column :users, :mailbox, :string, null: true
  end
end
