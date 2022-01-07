require 'rails_helper'

RSpec.describe SidebarItemComponent, type: :component do
  describe '#initialize' do
    let(:component) { SidebarItemComponent.new(path: 'test_path', title: 'test_title', icon: 'test_icon') }
    it { expect(component.instance_variable_get(:@path)).to eq('test_path') }
    it { expect(component.instance_variable_get(:@title)).to eq('test_title') }
    it { expect(component.instance_variable_get(:@icon)).to eq('test_icon') }
  end
end
