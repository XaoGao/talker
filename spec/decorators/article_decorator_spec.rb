require 'rails_helper'

RSpec.describe ArticleDecorator do
  let(:article) { build(:article, created_at: '2021-01-24 11:33:05.877543') }
  subject(:article_decorator) { article.decorate }

  describe '.created_time', :focus do
    it { expect(subject.created_time).to eq('2021 01 11:33') }
  end
end
