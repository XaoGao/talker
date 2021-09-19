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
  describe '.service_active?' do
    context 'when service is exist' do
      let!(:toggle_service) { create(:toggle_service, name: 'test service', work: true, env: 'test') }
      it 'should be service is worked' do
        expect(described_class.service_active?('test service', 'test')).to be true
      end

      it 'should be service is not work' do
        toggle_service.update!(work: false)
        expect(described_class.service_active?('test service', 'test')).to be false
      end
    end

    context 'when service is not exist' do
      it 'should be service is worked' do
        expect(described_class.service_active?('test service', 'test')).to be false
      end
    end
  end
end
