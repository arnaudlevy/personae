class Cluster < ApplicationRecord
  THRESHOLD = 25

  belongs_to :variable
  has_and_belongs_to_many :persons

  def self.build(variable, persons)
    variable.clusters.reload.each do |c|
      return if c.has_persons?(persons)
    end
    cluster = Cluster.create(variable: variable)
    cluster.persons = persons
  end

  def has_persons?(list)
    persons.pluck(:id).sort == list.pluck(:id).sort
  end

  def to_s
    persons.join(' ')
  end
end
