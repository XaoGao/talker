# frozen_string_literal: true

class SidebarItemComponent < ViewComponent::Base
  attr_reader :icon

  def initialize(path:, title:, icon: nil)
    @path = path
    @title = title
    @icon = icon
  end

  alias icon? icon
end
