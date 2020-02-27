class Person < ApplicationRecord
  belongs_to :study
  has_many :evaluations
  accepts_nested_attributes_for :evaluations

  def value_for(variable)
    evaluations.where(variable: variable).first_or_create.value
  end

  def to_s
    "U#{code}"
  end
end
