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

RSpec.describe JekyllSlugify::Slugify do
  let(:txt) { 'Hello Worlds!' }

  it 'slugifies strings' do
    string = JekyllSlugify::Slugify.new(txt).to_s
    expect(string).not_to be nil
    expect(string).to be_a String
    expect(string).to match(/^[a-z\-]+$/)
  end

  it 'slugifies non-latin strings' do
    string = JekyllSlugify::Slugify.new('Ærøskøbing', mode: 'latin').to_s
    expect(string).not_to be nil
    expect(string).to be_a String
    expect(string).to match(/^[a-z\-]+$/)
  end

  it 'does not slugify ideograms (such as kanji)' do
    expect do
      JekyllSlugify::Slugify.new('指事字', mode: 'latin')
    end .to raise_error RuntimeError
  end

  it 'supports upercase slugifying' do
    string = JekyllSlugify::Slugify.new(txt, cased: true).to_s
    expect(string).not_to be nil
    expect(string).to be_a String
    expect(string).to match(/^[A-Za-z\-]+$/)
  end
end

RSpec.describe JekyllSlugify::Slugify do
  let(:txt) { 'Ærøskø.~ 指_事 Worlds!' }

  it 'supports `raw` mode' do
    raw = JekyllSlugify::Slugify.new(txt, mode: 'raw').to_s

    expect(raw).not_to be nil
    expect(raw).to be_a String
    expect(raw).not_to match(/\s/)
  end

  it 'supports `pretty` mode' do
    pretty = JekyllSlugify::Slugify.new(txt, mode: 'pretty').to_s

    expect(pretty).not_to be nil
    expect(pretty).to be_a String
    expect(pretty).not_to match(/\s/)
  end

  it 'supports `ascii` mode' do
    ascii = JekyllSlugify::Slugify.new(txt, mode: 'ascii').to_s

    expect(ascii).not_to be nil
    expect(ascii).to be_a String
    expect(ascii).to match(/^[a-z\-]+$/)
  end

  it 'deals with unregistered modes' do
    unknown = JekyllSlugify::Slugify.new(txt, mode: 'foobar').to_s

    expect(unknown).not_to be nil
    expect(unknown).to be_a String
    expect(unknown).to match(/^[a-z\-]+$/)
  end
end
