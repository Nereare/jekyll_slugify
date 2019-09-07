# frozen_string_literal: true

RSpec.describe JekyllSlugify do
  let(:version) do
    JekyllSlugify.version
  end
  it 'has a version number' do
    expect(version).not_to be nil
    expect(version).to be_a String
  end
end
