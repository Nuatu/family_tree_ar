class AddReferencesToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.references :parents
    end
  end
end
