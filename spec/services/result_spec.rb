require 'rails_helper'
describe Result do
  context '.succcss?' do
    result_success = Result.new(true)
    result_error = Result.new(false)
    it { expect(result_success.success?).to be true }
    it { expect(result_error.success?).to be false }
  end

  context '.error?' do
    result_success = Result.new(true)
    result_error = Result.new(false)
    it { expect(result_success.error?).to be false }
    it { expect(result_error.error?).to be true }
  end
end
