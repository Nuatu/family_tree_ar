require 'spec_helper'

describe Relationship do
  it { should belong_to :person }

  it 'describes a person as a child of 2 people' do
    steve = Person.create({:name => "Steve"})
    rhonda = Person.create({:name => "Rhonda"})
    robert = Person.create({:name => "Robert"})
    Relationship.make_connection({:parents => [steve, rhonda], :child => robert})
    expect(robert.parents).to eq [steve, rhonda]
    expect(rhonda.children).to eq [robert]
    expect(steve.children).to eq [robert]
  end

  it 'describes two persons as a children of 2 people' do
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
end
