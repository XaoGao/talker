# == Schema Information
#
# Table name: pictures
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0), not null
#  imageable_type :string           not null
#  is_main        :boolean          default(FALSE), not null
#  likes_count    :integer          default(0), not null
#  title          :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe 'methods' do
    context '#type_with_id' do
      let(:picture) { create(:picture) }
      it 'should return a string class name with id' do
        expect(picture.type_with_id).to eq('Picture-1')
      end
    end
  end
end
