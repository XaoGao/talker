# frozen_string_literal: true

class GenderComponent < ViewComponent::Base
  def initialize(f:)
    @f = f
  end

  def gendes
    gendes ||= User.genders.keys.to_a
  end

  def humanize_gender
    [
      [I18n.t('users.gender.unset'), 'unset'],
      [I18n.t('users.gender.man'), 'man'],
      [I18n.t('users.gender.woman'), 'woman'],
      [I18n.t('users.gender.another'), 'another']
    ]
  end
end
