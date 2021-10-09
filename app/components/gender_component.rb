# frozen_string_literal: true

class GenderComponent < ViewComponent::Base
  def initialize(f:)
    @f = f
  end

  def gendes
    all_gender ||= User.genders.keys.to_a
  end

  def humanize_gender
    [[I18n.t('users.gender.not_set'), 'not_set'], [I18n.t('users.gender.man'), 'man'], [I18n.t('users.gender.woman'), 'woman'], [I18n.t('users.gender.another'), 'another']]
  end
end
