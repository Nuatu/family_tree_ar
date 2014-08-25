class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer "person_id"
      t.integer "parent_id"
      t.integer "child_id"
    end
  end
end
