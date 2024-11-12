import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    hotelMarkers: Array,
    crimeMarkers: Array,
    controlMap: Array
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
    const bounds = new mapboxgl.LngLatBounds();
    this.hotelMarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #addHotelMarkersToMap() {
    this.hotelMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setPopup(popup)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #addCrimeMarkersToMap() {
    this.crimeMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }
}
