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



// Directions Map
function initDirectionsMap() {

  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var current_marker = JSON.parse(mapDirectionsElement.dataset.current);
  var map = new google.maps.Map(document.getElementById('directions_map'), {
    zoom: 6,
    center: {lat: current_marker[0].lat, lng: current_marker[0].lng}
  });
  directionsDisplay.setMap(map);

  window.addEventListener('load', function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  });
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
  var waypts = [{location: document.getElementById('start').innerText, stopover: true}];
  var current_marker = JSON.parse(mapDirectionsElement.dataset.current);

  directionsService.route({
    origin: {lat: current_marker[0].lat, lng: current_marker[0].lng},
    destination: document.getElementById('end').innerText,
    waypoints: waypts,
    optimizeWaypoints: true,
    travelMode: 'DRIVING'
  }, function(response, status) {
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
      var route = response.routes[0];
      document.getElementById('Distance1').innerText = route.legs[0].distance.text;
      document.getElementById('Distance2').innerText = route.legs[1].distance.text;
      document.getElementById('Distance3').innerText = `${Math.round( (route.legs[0].distance.value + route.legs[1].distance.value)/1609.34 * 10 ) / 10} mi`;
      document.getElementById('Time1').innerText = route.legs[0].duration.text;
      document.getElementById('Time2').innerText = route.legs[1].duration.text;
      document.getElementById('Time3').innerText = `${Math.round( (route.legs[0].duration.value + route.legs[1].duration.value)/60)} mins`;
      console.log(route);
      var summaryPanel = document.getElementById('directions-panel');
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

const mapDirectionsElement = document.getElementById('directions_map');
if (mapDirectionsElement) {
  initDirectionsMap();
}

