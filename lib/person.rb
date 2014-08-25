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


  def siblings
    siblings = []

    one = self.parents[0]
    three = []

    two = Relationship.where(:parent_id => one.id)

    two.each do |person|
      three << person.person_id
    end

    three.delete(self.id)

    # three = Person.where(:id => two[1].person_id)



    # self.parents.each do |parent|
    #   one.push(Relationship.where(:parent_id => parent.id))
    # end

  end


  private


  def make_marriage_reciprocal
    if spouse_id_changed?
      spouse.update(:spouse_id => id)
    end
  end

end
