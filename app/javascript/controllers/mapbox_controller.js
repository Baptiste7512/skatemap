import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    // Utilisation de la localisation par mapbox, mais ne sauvegarde pas 
    this.map.addControl(
      new mapboxgl.GeolocateControl({
          positionOptions: {
              enableHighAccuracy: true
          },
          //  Permet de modifier la position en temps réel
          trackUserLocation: true,
          // Dessinez une flèche à côté du point d'emplacement pour indiquer dans quelle direction l'appareil se dirige.
          showUserHeading: true
      })
    );

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // Geolocalisation User
    // navigator.geolocation.getCurrentPosition(function(position) {

    //   let latitude = position.coords.latitude;
    //   let longitude = position.coords.longitude;
    // })

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker({ "color": "#9C836D" })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
