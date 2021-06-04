# frozen_string_literal: true

class GenderComponent < ViewComponent::Base
  def initialize(f:)
    @f = f
  end

  def gendes
    all_gender ||= User.genders.keys.to_a
  end

  def humanize_gender
    [['Не указан', 'not_set'], ['Мужской', 'man'], ['Женский', 'woman'], ['Другой', 'another']]
  end
end
