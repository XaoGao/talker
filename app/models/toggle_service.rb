# == Schema Information
#
# Table name: toggle_services
#
#  id         :integer          not null, primary key
#  env        :string           not null
#  name       :string           not null
#  work       :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ToggleService < ApplicationRecord
  def self.service_active?(name, env)
    service = find_by(name: name, env: env)
    return false if service.nil?

    service.work
  end
end
