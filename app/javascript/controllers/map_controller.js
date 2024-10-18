import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    hotelMarkers: Array,
    crimeMarkers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.#addHotelMarkersToMap();
    this.#fitMapToMarkers();
    this.#addCrimeMarkersToMap();
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.hotelMarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addHotelMarkersToMap() {
    this.hotelMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setPopup(popup)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });

  }
  #addCrimeMarkersToMap() {
    console.log(this.crimeMarkersValue)
    this.crimeMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setText(`Crime: ${marker.type}`);

      new mapboxgl.Marker({ color: 'red' })
        .setPopup(popup)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });

  }

  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
}
