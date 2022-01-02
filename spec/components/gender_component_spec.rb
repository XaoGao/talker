require 'rails_helper'

RSpec.describe GenderComponent, type: :component do
  let(:component) { GenderComponent.new(f: nil) }
  it '.genders' do
    expect(component.gendes).to eq(User.genders.keys.to_a)
  end

  it '.humanize_gender' do
    expect(component.humanize_gender).to eq([[I18n.t('users.gender.unset'), 'unset'],
                                             [I18n.t('users.gender.man'), 'man'],
                                             [I18n.t('users.gender.woman'), 'woman'],
                                             [I18n.t('users.gender.another'), 'another']])
  end
end
