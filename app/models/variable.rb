class Variable < ApplicationRecord
  belongs_to :study
  has_many :evaluations
  accepts_nested_attributes_for :evaluations

  def to_s
    "#{name}"
  end
end
