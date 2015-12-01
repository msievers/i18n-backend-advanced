describe I18n::Backend::Advanced do
  let(:i18n_backend_advanced) do
    I18n::Backend::Advanced.new.tap do |_i18n_backend_advanced|
      _i18n_backend_advanced.load_translations Dir.glob("#{assets_path}/**/*.yml")
    end
  end

  it "translates the given keys" do
    [
      ["application.cancel", "Abbrechen"],
      ["users.index.cancel", "Abbrechen"],
      ["users.index.languages.en", "Englisch"],
      ["users.index.submit", "Abschicken"]
    ]
    .each do |key, value|
      expect(i18n_backend_advanced.translate(:de, key)).to eq(value)
    end
  end
end
