# frozen_string_literal: true

RSpec.describe String do
  let(:txt) { 'Ærøskø.~ 指_事 Worlds!'.slugify }

  it 'slugifies strings' do
    expect(txt).not_to be nil
    expect(txt).to be_a String
    expect(txt).to match(/^[a-z\-]+$/)
  end
end
