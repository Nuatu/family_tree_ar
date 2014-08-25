class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string "name"
      t.integer "mother_id"
      t.integer "father_id"
    end
  end
end
