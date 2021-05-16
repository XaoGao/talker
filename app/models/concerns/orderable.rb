module Orderable
  extend ActiveSupport::Concern

  included do
    scope :recently, -> { order('id DESC') }
  end
end
