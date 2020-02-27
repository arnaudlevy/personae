class Person < ApplicationRecord
  belongs_to :study
  has_many :evaluations
  accepts_nested_attributes_for :evaluations
  has_and_belongs_to_many :clusters

  def evaluation_for(variable)
    evaluations.where(variable: variable).first_or_create
  end

  def value_for(variable)
    evaluation_for(variable).value
  end

  def no_value_for?(variable)
    evaluation_for(variable).no_value?
  end

  def persons_close_on(variable)
    persons = []
    value = value_for(variable)
    return persons if value.nil?
    study.persons.where.not(id: id).each do |p|
      other_value = p.value_for(variable)
      next if other_value.nil?
      distance = (value - other_value).abs
      persons << p if distance < Cluster::THRESHOLD
    end
    persons
  end

  def create_evaluations
    study.variables.each do |variable|
      Evaluation.where(person: self, variable: variable).first_or_create
    end
  end

  def to_s
    "U#{code}"
  end
end
