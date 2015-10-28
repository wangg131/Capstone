// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//
// var map = L.map('map').setView([0, 0], 2);
// L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
//     attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
// }).addTo(map);
// L.Control.geocoder().addTo(map);
//
//
// L.Routing.control({
//     waypoints: [
//         L.latLng(57.74, 11.94),
//         L.latLng(57.6792, 11.949)
//     ],
//     routeWhileDragging: true,
//     geocoder: L.Control.Geocoder.nominatim()
// }).addTo(map);

$(document).ready(function() {

  L.mapbox.accessToken = 'pk.eyJ1Ijoid2FuZ2cxMzEiLCJhIjoiY2lnYjd6Ymt0MGNnNndnbTRrM3g2eXFkeSJ9.el5dbE3E7doAEXn3S02lHg;';

  var mapboxTiles = L.tileLayer('https://api.mapbox.com/v4/mapbox.streets/{z}/{x}/{y}.png?access_token=' + L.mapbox.accessToken, {
      attribution: '<a href="http://www.mapbox.com/about/maps/" target="_blank">Terms &amp; Feedback</a>'
  });

  var map = L.map('map')
      .addLayer(mapboxTiles)
      .setView([42.3610, -71.0587], 15);

  L.mapbox.map('map', 'wangg131.o1281065')
     .setView([40, -74.50], 9);

}



  //  L.mapbox.markerLayer({
  //       type: 'Feature',
  //       geometry: {
  //       type: 'MultiPoint',
  //       coordinates: [ <%=getPins()%> ]
  //   },
  //       properties: {
  //           title: ['A Pin'],
  //           description: ['1234'],
  //       }
  //   }).addTo(map);
