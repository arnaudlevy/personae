class Study < ApplicationRecord
  has_many :persons
  has_many :variables

  def build_clusters
    variables.find_each &:build_clusters
  end

  def to_s
    "#{name}"
  end
end
