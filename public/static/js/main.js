$(function() {

	function onProjectCreationPage() {
		return $("input#Location").length > 0;
	}

	// --- project creation page ---
	if (onProjectCreationPage()) {
		new google.maps.places.Autocomplete($("input#Location")[0]);
	}

	// --- project (view) page ---
	if (!onProjectCreationPage()) {

		new google.maps.Geocoder().geocode({'address': $('#location').text()}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var location = results[0].geometry.location;
				var map = new google.maps.Map($('#map-canvas')[0], {
					zoom: 15,
					center: location,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					disableDefaultUI: true,
					zoomControl: true
				});
				new google.maps.Marker({ map: map, position: location });
			} else {
				$('#map-canvas').empty().append('<img src="../static/img/map-placeholder.jpg"/>');
			}
		});
	}

});
