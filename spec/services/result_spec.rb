require 'rails_helper'
RSpec.describe Result do
  describe 'status' do
    result_success = Result.new(true)
    result_error = Result.new(false)
    context '.succcss?' do
      it { expect(result_success.success?).to be true }
      it { expect(result_error.success?).to be false }
    end

    context '.error?' do
      it { expect(result_success.error?).to be false }
      it { expect(result_error.error?).to be true }
    end
  end
end
