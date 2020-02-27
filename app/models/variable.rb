class Variable < ApplicationRecord
  belongs_to :study
  has_many :evaluations
  accepts_nested_attributes_for :evaluations
  has_many :clusters

  def build_clusters
    clean_clusters!
    study.persons.each do |p|
      next if p.no_value_for?(self)
      others = p.persons_close_on(self)
      persons = [p].concat others
      Cluster.build(self, persons)
    end
  end

  def to_s
    "#{name}"
  end

  protected

  def clean_clusters!
    clusters.destroy_all
  end
end
