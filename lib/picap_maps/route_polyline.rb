class RoutePolyline
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in client: "mongo_map"

  belongs_to :origin_hexagon, class_name: "HexagonGeo", index: true
  belongs_to :destination_hexagon, class_name: "HexagonGeo", index: true

  field :encoded_polyline, type: String
  field :time_in_minutes, type: Integer
  field :distance_in_meters, type: Integer

end