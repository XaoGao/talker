module Activeable
  extend ActiveSupport::Concern

  included do
    scope :actived,   -> { where(lock: false) }
    scope :disabled, -> { where(lock: true) }
  end
end
