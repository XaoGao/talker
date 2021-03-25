module Orderable
  extend ActiveSupport::Concern

  def recently
    order('id DESC')
  end
end
