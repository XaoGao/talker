require 'rails_helper'
RSpec.describe Service do
  describe 'status' do
    let(:service) { Service.new }
    context '.success' do
      it { expect(service.send(:success, 'test')).to be_an_instance_of(Result) }
    end

    context '.error' do
      it { expect(service.send(:error, 'test')).to be_an_instance_of(Result) }
    end
  end
end
