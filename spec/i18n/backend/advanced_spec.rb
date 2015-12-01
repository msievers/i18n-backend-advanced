describe I18n::Backend::Advanced do
  let(:backend) do
    described_class.new.tap do |_backend|
      _backend.load_translations Dir.glob("#{assets_path}/**/*.yml")
    end
  end

  [
    ["application.cancel", "Abbrechen"],
    ["users.index.cancel", "Abbrechen"],
    ["users.index.languages.en", "Englisch"],
    ["users.index.submit", "Abschicken"],
    ["users.index.greet", { user: "Max" }, "Hallo Max!"],
    ["users.index.inbox", { count: 1 }, "Eine Nachricht"],
    ["users.index.inbox", { count: 2 }, "2 Nachrichten"]
  ]
  .each do |_key, _options, _value|
    if _options && _value.nil?
      _value = _options
      _options = {}
    end

    describe ["translate \"#{_key}\"", _options.empty? ? nil : _options].compact.join(", ") do
      subject { backend.translate(:de, _key, _options) }
      it { is_expected.to eq(_value) }
    end
  end
end
