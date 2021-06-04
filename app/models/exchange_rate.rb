# == Schema Information
#
# Table name: exchange_rates
#
#  id         :integer          not null, primary key
#  EUR        :integer          default(0), not null
#  USD        :integer          not null
#  last       :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ExchangeRate < ApplicationRecord
  # scope :last_rate, -> { find_by(last: true) }

  def self.last_rate
    find_by(last: true)
  end
end
