class Person < ApplicationRecord
  belongs_to :study
  has_many :evaluations
  accepts_nested_attributes_for :evaluations

  def evaluation_for(variable)
    evaluations.where(variable: variable).first_or_create
  end

  def value_for(variable)
    evaluation_for(variable).value
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
