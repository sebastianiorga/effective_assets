if defined?(EffectiveRegions)
  module Effective
    module Snippets
      class EffectiveAsset < Snippet
        attribute :asset_id, Integer
        attribute :html_class, String
        attribute :link_title, String

        def asset
          @asset ||= (Effective::Asset.where(:id => asset_id).first if asset_id)
        end

        def snippet_tag
          :span
        end

      end
    end
  end
end
