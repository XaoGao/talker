# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  comments_count :integer          default(0), not null
#  imageable_type :string           not null
#  is_main        :boolean          default(FALSE), not null
#  title          :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
require 'rails_helper'

RSpec.describe Picture, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
