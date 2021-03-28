module Activeable
  extend ActiveSupport::Concern

  included do
    scope :all_active,   -> { where(lock: false) }
    scope :all_disabled, -> { where(lock: true) }
  end
end
