import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

var map;
var infowindow;
var service;

function initMap() {
  const markers = JSON.parse(mapElement.dataset.markers);
  var pyrmont = {lat: markers[0].lat, lng: markers[0].lng};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 14
  });
  var pinColor = "656CB9";
  var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
      new google.maps.Size(21, 34),
      new google.maps.Point(0,0),
      new google.maps.Point(10, 34));
  new google.maps.Marker({
    map: map,
    position: pyrmont,
    icon: pinImage,
    title: "Current Location"
  });

  infowindow = new google.maps.InfoWindow();
  service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 3000,
    types: ['veterinary_care']
  }, callback);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  var request = { reference: place.reference };
  service.getDetails(request, function(details, status) {
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent("<strong>"+details.name + "</strong><br />" + details.formatted_address +"<br />" + details.formatted_phone_number);
      infowindow.open(map, this);
    });
  });
}


const mapElement = document.getElementById('map');
if (mapElement) {
  initMap();
}

autocomplete();
