import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

var map;
var infowindow;
var service;
var pinUserColor = "656CB9";
var pinUserImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinUserColor,
  new google.maps.Size(21, 60),
  new google.maps.Point(0,0),
  new google.maps.Point(10, 60));
var pinColor = "138913";
var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
    new google.maps.Size(21, 34),
    new google.maps.Point(0,0),
    new google.maps.Point(10, 34));
var rows = document.querySelectorAll('.request_index_row');

function initMap() {
  const markers = JSON.parse(mapElement.dataset.markers);
  const current_marker = JSON.parse(mapElement.dataset.current);
  var center = {lat: current_marker[0].lat, lng: current_marker[0].lng, name: current_marker[0].name};

  map = new google.maps.Map(document.getElementById('map'), {
    center: center,
    zoom: 13
  });
  createUserMarker(center);

  markers.forEach(function(element) {
      createUserMarker(element);
    });

    infowindow = new google.maps.InfoWindow();
    service = new google.maps.places.PlacesService(map);

  if (mapElement.dataset.extras != "none") {
      service.nearbySearch({
        location: center,
        radius: 3000,
        types: ['veterinary_care']
      }, callback);
  }
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}



function createUserMarker(place) {
  var placeLoc = {lat: place.lat, lng: place.lng};
  if (place.address){
    var marker = new google.maps.Marker({
    map: map,
    position: placeLoc,
    icon: pinUserImage,
  });} else {
      var marker = new google.maps.Marker({
      map: map,
      position: placeLoc,
      icon: pinImage,
    });
    }

  google.maps.event.addListener(marker, 'click', function() {
    if (place.address) {
      infowindow.setContent("<strong>"+ place.name + "</strong><br />" + place.address +"<br />");
    }
    else {
      infowindow.setContent("<strong>"+ place.name + "</strong>");
    }
      infowindow.open(map, this);

    rows.forEach(function(element) {
      if (element.innerText.includes(place.name)) {
        element.style.display = "block";
      } else {
        element.style.display = "none";
      }
    });
  });
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
