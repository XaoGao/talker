require "rails_helper"

RSpec.describe GenderComponent, type: :component do
  let(:component) { GenderComponent.new(f: nil) }
  it '.genders' do
    expect(component.gendes).to eq(User.genders.keys.to_a)
  end

  it '.humanize_gender' do
    expect(component.humanize_gender).to eq([['Не указан', 'not_set'], ['Мужской', 'man'], ['Женский', 'woman'], ['Другой', 'another']])
  end
end
