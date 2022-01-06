module Typeable
  extend ActiveSupport::Concern

  def type_with_id
    "#{self.class}-#{self.id}"
  end

  def type
    self.class
  end
end
