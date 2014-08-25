class Person < ActiveRecord::Base
  validates :name, :presence => true
  after_save :make_marriage_reciprocal
  has_many :children, through: :relationships
  has_many :parents, through: :relationships

  has_many :relationships, :class_name => 'Relationship', :foreign_key => 'person_id'

  def spouse
    if spouse_id.nil?
      nil
    else
      Person.find(spouse_id)
    end
  end

  def grandparents
    grandparents = []
    self.parents.each do |parent|

      parent.parents.each do |x|
        grandparents << x
      end
    end
    grandparents
  end

  private


  def make_marriage_reciprocal
    if spouse_id_changed?
      spouse.update(:spouse_id => id)
    end
  end

end
