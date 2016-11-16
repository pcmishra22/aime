class AddUserToParents < ActiveRecord::Migration
  def change
    add_reference :parents, :user, foreign_key: true
    add_index(:parents, :user_id, :unique => true)
  end
end
