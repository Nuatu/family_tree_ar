class Relationship < ActiveRecord::Base

  belongs_to :person, class_name: 'Person', :foreign_key => 'person_id'
  belongs_to :child, class_name: 'Person', :foreign_key => 'child_id'
  belongs_to :parent, class_name: 'Person', :foreign_key => 'parent_id'

  def self.make_connection attributes
    child = attributes[:child]
    parents = attributes[:parents]
    child.parents << parents
    parents.each { |parent| parent.children << child }
  end
end
