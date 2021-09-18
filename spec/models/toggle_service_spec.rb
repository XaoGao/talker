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
require 'rails_helper'

RSpec.describe ToggleService, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
