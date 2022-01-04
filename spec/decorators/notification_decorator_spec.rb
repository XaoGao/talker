require 'rails_helper'

RSpec.describe NotificationDecorator do
  let(:notification) { build(:notification, created_at: '2021-01-24 11:33:05.877543') }
  subject(:notification_decorator) { notification.decorate }

  describe '.created_time' do
    it { expect(subject.created_time).to eq('2021-01-24') }
  end
end
