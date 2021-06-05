# == Schema Information
#
# Table name: exchange_rates
#
#  id         :integer          not null, primary key
#  EUR        :string           default(""), not null
#  USD        :string           not null
#  current    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ExchangeRate < ApplicationRecord
  # scope :last_rate, -> { find_by(last: true) }

  def self.last_rate
    find_by(current: true)
  end
end
