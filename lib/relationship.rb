class Relationship < ActiveRecord::Base

  belongs_to :person, class_name: 'Person', :foreign_key => 'person_id'
  belongs_to :child, class_name: 'Person', :foreign_key => 'child_id'
  belongs_to :parent, class_name: 'Person', :foreign_key => 'parent_id'

end
