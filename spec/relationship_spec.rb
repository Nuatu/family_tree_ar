require 'spec_helper'

describe Relationship do
  it { should belong_to :person }

  it 'returns a person as a child of 2 people' do
    steve = Person.create({:name => "Steve"})
    rhonda = Person.create({:name => "Rhonda"})
    robert = Person.create({:name => "Robert"})
    Relationship.make_connection({:parents => [steve, rhonda], :child => robert})
    expect(robert.parents).to eq [steve, rhonda]
    expect(rhonda.children).to eq [robert]
    expect(steve.children).to eq [robert]
  end

  it 'returns all children of a person' do
    steve = Person.create({:name => "Steve"})
    rhonda = Person.create({:name => "Rhonda"})
    robert = Person.create({:name => "Robert"})
    sally = Person.create({:name => "Sally"})
    Relationship.make_connection({:parents => [steve, rhonda], :child => robert})
    Relationship.make_connection({:parents => [steve, rhonda], :child => sally})
    expect(robert.parents).to eq [steve, rhonda]
    expect(sally.parents).to eq [steve, rhonda]
    expect(rhonda.children).to eq [robert, sally]
    expect(steve.children).to eq [robert, sally]
  end

   it 'returns 4 persons as grandparents of a person' do
    steve = Person.create({:name => "Steve"})
    rhonda = Person.create({:name => "Rhonda"})
    robert = Person.create({:name => "Robert"})
    steve_dad = Person.create({:name => "SteveDad"})
    steve_mom = Person.create({:name => "SteveMom"})
    rhonda_dad = Person.create({:name => "RhondaDad"})
    rhonda_mom = Person.create({:name => "RhondaMom"})
    Relationship.make_connection({:parents => [steve, rhonda], :child => robert})

    Relationship.make_connection({:parents => [steve_dad, steve_mom], :child => steve})

    Relationship.make_connection({:parents => [rhonda_dad, rhonda_mom], :child => rhonda})

    expect(robert.grandparents).to eq [steve_dad, steve_mom, rhonda_dad, rhonda_mom]

  end
end
