import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    // console.log(this.markerValue)
    console.log("connected")
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()

  }

    #addMarkerToMap() {
        new mapboxgl.Marker()
          .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
          .addTo(this.map);
    }

    #fitMapToMarker() {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
  }
