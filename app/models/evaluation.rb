class Evaluation < ApplicationRecord
  belongs_to :variable
  belongs_to :person

  before_create :set_default_value

  def no_value=(nv)
    self.value = nil if (nv == true || nv == '1')
  end

  def no_value
    value.nil?
  end

  protected

  def set_default_value
    self.value = 50
  end
end
