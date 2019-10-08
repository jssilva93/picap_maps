class HexagonGeo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :address, type: String
  field :g_sublocality_lv_1, type: String
  field :g_neighborhood, type: String
  field :g_adm_area_lv_1, type: String
  field :g_adm_area_lv_2, type: String
  field :g_country, type: String
  field :g_locality, type: String
  field :area_geo_json, type: Hash, default: {}
  belongs_to :owner, polymorphic: true, index: true

  field :external_id, type: String
  field :center_coordinates, type: Array
  field :resolution, type: String
  before_create :set_area_geojson

  index({external_id: 1})
  index({external_id: 1, resolution: 1})

  store_in client: PicapMaps.configuration.database_name

  def add_attributes_to_obj  obj
    begin


      obj['g_country'] = self.g_country

      obj['g_adm_area_lv_1'] = self.g_adm_area_lv_1

      obj['g_adm_area_lv_2'] = self.g_adm_area_lv_2

      obj['g_neighborhood'] = self.g_neighborhood

      obj['g_locality'] = self.g_locality


    rescue Exception => e
      p e
      pp e.backtrace
    end
  end


  private

  def set_area_geojson
    coordinates_array = H3.new.h3_to_geo_boundary self.external_id
    geojson_array = []
    sum_lat = 0
    sum_lon = 0
    coordinates_array.each do |coordinate|
      geojson_array << [coordinate["lon"], coordinate["lat"]]
      sum_lat += coordinate["lat"]
      sum_lon += coordinate["lon"]
    end
    geojson_array << [coordinates_array[0]["lon"], coordinates_array[0]["lat"]]
    self.area_geo_json = {type: "MultiPolygon", coordinates: [[geojson_array]]}
    self.center_coordinates = [sum_lat / 6, sum_lon / 6]
  end
end