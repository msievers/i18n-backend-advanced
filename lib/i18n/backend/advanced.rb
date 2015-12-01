require "i18n"

module I18n
  module Backend
    class Advanced < Simple
      def init_translations
        super
        expand_referenced_values!(translations)
      end

      private

      def expand_referenced_values!(object)
        deep_transform_values!(object) do |_value, _path|
          if _value.is_a?(String) && _value.include?("~>")
            while _value.include?("~>")
              referenced_path = [_path.first, _value.gsub("~>", "").strip.split(".").map(&:to_sym)].flatten(1)
              _value = referenced_path.inject(translations) do |_object, _key|
                if object.is_a?(Hash)
                  _object[_key]
                end
              end
            end
          end

          _value
        end
      end

      def deep_transform_values!(object, path = [], &block)
        case object
        when Hash
          object.keys.each do |_key|
            current_path = [path, _key].flatten(1)
            object[_key] = yield(deep_transform_values!(object[_key], current_path, &block), current_path)
          end
        end

        object
      end
    end
  end
end
