class RoutePolyline
  include Mongoid::Document
  include Mongoid::Timestamps
  store_in client: PicapMaps.configuration.database_name

  belongs_to :origin_hexagon, class_name: "HexagonGeo", index: true
  belongs_to :destination_hexagon, class_name: "HexagonGeo", index: true


  index({origin_hexagon_id: 1, destination_hexagon_id: 1})
  field :route, type: Hash

end