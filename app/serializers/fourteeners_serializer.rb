class FourteenersSerializer
  include JSONAPI::Serializer
  attributes :english_name, :arapahoe_name, :arapahoe_translation, :ute_name, :ute_translation, :elevation, :range, :county, :nearby_towns, :hiking_routes, :climate, :geology, :first_ascent, :history, :resources, :image, :map, :created_at, :updated_at
end
