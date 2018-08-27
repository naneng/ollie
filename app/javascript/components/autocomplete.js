function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var pickupAddress = document.getElementById('pickup_loc');
    var dropoffAddress = document.getElementById('dropoff_loc');
    if (pickupAddress) {
      var autocomplete = new google.maps.places.Autocomplete(pickupAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(pickupAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
    if (dropoffAddress) {
      var autocomplete = new google.maps.places.Autocomplete(dropoffAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(dropoffAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
