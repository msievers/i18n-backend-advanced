describe I18n::Backend::Advanced do
  let(:backend) do
    described_class.new.tap do |_backend|
      _backend.load_translations Dir.glob("#{assets_path}/**/*.yml")
    end
  end

  it "translates the given keys" do
    [
      ["application.cancel", "Abbrechen"],
      ["users.index.cancel", "Abbrechen"],
      ["users.index.languages.en", "Englisch"],
      ["users.index.submit", "Abschicken"]
    ]
    .each do |_key, _value|
      expect(backend.translate(:de, _key)).to eq(_value)
    end
  end
end
