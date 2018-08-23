import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

var distances = document.querySelectorAll('.distance_from_me');
var pickup = document.querySelectorAll('.pickup_loc');
var current = document.getElementById('current_location').innerText;
var geocoder = new google.maps.Geocoder();
var latitude = 0;
var longitude = 0;
var i = 0;
geocoder.geocode( { 'address': current}, function(results, status) {
  latitude = results[0].geometry.location.lat();
  longitude = results[0].geometry.location.lng();
  pickup.forEach(function(element) {
    geocoder.geocode( { 'address': element.innerText}, function(results, status) {
    var new_latitude = results[0].geometry.location.lat();
    var new_longitude = results[0].geometry.location.lng();
    var dist = distance(latitude, longitude, new_latitude, new_longitude);
    distances[i].insertAdjacentText("afterbegin",`${parseFloat(dist).toFixed(1)} Miles`);
    i = i + 1;
    });
  });
});

function distance(lat1, lon1, lat2, lon2) {
  var radlat1 = Math.PI * lat1/180
  var radlat2 = Math.PI * lat2/180
  var theta = lon1-lon2
  var radtheta = Math.PI * theta/180
  var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
  if (dist > 1) {
    dist = 1;
  }
  dist = Math.acos(dist)
  dist = dist * 180/Math.PI
  dist = dist * 60 * 1.1515
  return dist
}
