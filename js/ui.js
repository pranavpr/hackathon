/* Initialize Menu and Map */
var ready;
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
        var mapOptions = {
            center: {
                lat: -34.397,
                lng: 150.644
            },
            zoom: 8
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    }
    google.maps.event.addDomListener(document, 'page:change', initialize);
};

/* Draw Map */
$(document).ready(ready);
$(document).on('page:load', ready);

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