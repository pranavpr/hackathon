/* Global variables */
var ready;
var map;
var geocoder;

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
                        zoom: 12
                    };

                    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
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
    var postalcode = $("#pincode").val();
    var country = $("#country").val();
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'address': address + country + postalcode,
        'region': 'IN'
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var marker = new google.maps.Marker({
                position: results[0].geometry.location,
                map: map,
                title: results[0].formatted_address
            });
            var infowindow = new google.maps.InfoWindow({
                content: results[0].formatted_address
            });
            map.setCenter(results[0].geometry.location);
            map.setZoom(16);
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map, marker);
            });
        } else {
            alert(address + " not found.");
        }
    });
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