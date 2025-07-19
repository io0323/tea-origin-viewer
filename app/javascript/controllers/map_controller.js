/*
  Leaflet.jsで地図を描画し、TeaOriginのピンを表示するStimulusコントローラ
*/
import { Controller } from "@hotwired/stimulus"
import L from "leaflet"

/*
  Leafletデフォルトマーカー画像のパスをpublic直下に修正
*/
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: "/marker-icon-2x.png",
  iconUrl: "/marker-icon.png",
  shadowUrl: "/marker-shadow.png"
});

export default class extends Controller {
  static values = { teaOrigins: Array }

  connect() {
    // 既存地図があれば削除
    if (this.map) {
      this.map.remove()
    }

    // 地図初期化
    this.map = L.map(this.element).setView([35.0, 135.0], 6) // 日本中心
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: "© OpenStreetMap contributors"
    }).addTo(this.map)

    // ピン追加
    this.teaOriginsValue.forEach(origin => {
      if (origin.latitude && origin.longitude) {
        const marker = L.marker([origin.latitude, origin.longitude]).addTo(this.map)
        marker.bindPopup(`
          <div class="text-sm">
            <strong>${origin.name}</strong><br>
            ${origin.location_name}<br>
            ロットID: ${origin.lot_id}<br>
            収穫日: ${origin.harvested_on}<br>
            ${origin.notes ? "メモ: " + origin.notes : ""}
          </div>
        `)
      }
    })
  }
} 