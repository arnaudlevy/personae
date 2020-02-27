class Study < ApplicationRecord
  has_many :persons
  has_many :variables

  def to_s
    "#{name}"
  end
end
