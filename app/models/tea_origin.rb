=begin
  茶の原料（生葉）の調達情報モデル
=end
class TeaOrigin < ApplicationRecord
  # バリデーション
  validates :name, :location_name, :latitude, :longitude, :lot_id, :harvested_on, presence: true
end
