/* Global variables */
var ready;
var map;
var geocoder;
var marker;

/* Initialize Menu and Map */
ready = function() {
    /* Menu Expand/Collapse */
    var layout = $('#layout'),
        menu = $('#menu'),
        menuLink = $('#menuLink');
    menuLink.click(function(evt) {
        var active = 'active';
        evt.preventDefault();
        layout.toggleClass(active);
        menu.toggleClass(active);
        menuLink.toggleClass(active);
    });
    /* Map Initialize */
    function initialize() {
        if ($("#map-canvas").length != 0) {
            /* Center map on client's Geolocation */
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                    var mapOptions = {
                        center: initialLocation,
                        zoom: 16
                    };
                    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                    marker = new google.maps.Marker({
                        position: initialLocation,
                        map: map,
                        draggable: true
                    });
                    google.maps.event.addListener(marker, 'dragend', function() {
                        geocodePosition(marker.getPosition());
                        map.panTo(marker.getPosition());
                        map.setZoom(16);
                    });
                });
            }
        }
    }
    google.maps.event.addDomListener(document, 'page:change', initialize);
    $("#search").click(function(evt) {
        evt.preventDefault();
        searchAddress();
    });
};

/* Draw Map */
$(document).ready(ready);
// $(document).on('page:chnage', ready);

/* Geocode Address */
function searchAddress() {
    var address = $("#address").val();
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'address': address,
        'region': 'IN'
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            marker.setPosition(results[0].geometry.location);
            map.setCenter(results[0].geometry.location);
        } else {
            alert(address + " not found.");
        }
    });
}

function geocodePosition(pos) {
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
            latLng: pos
        },
        function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                $("#address").val(results[0].formatted_address);
                //$("#mapErrorMsg").hide(100);
            } else {
                //$("#mapErrorMsg").html('Cannot determine address at this location.'+status).show(100);
            }
        }
    );
}

/* NProgress */
$(document).on('page:fetch', function() {
    NProgress.start();
});
$(document).on('page:change', function() {
    NProgress.done();
});
$(document).on('page:restore', function() {
    NProgress.remove();
});