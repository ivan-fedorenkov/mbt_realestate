$(->
  root = exports ? this

  initializeMapModal = ->
    root.mapCenter = new google.maps.LatLng($('#mapModalLat').val(), $('#mapModalLong').val())

    mapOptions = 
      zoom: 15
      center: root.mapCenter
      mapTypeId: google.maps.MapTypeId.ROADMAP
      zoomControl: true
      streetViewControl: false
      rotateControl: false
      overviewMapControl: false
      mapTypeControl: false

    root.map = new google.maps.Map(document.getElementById('mapModalMap'), mapOptions)
    mapMarker = new google.maps.Marker({position: root.mapCenter, map: root.map})

  google.maps.event.addDomListener(window, 'load', initializeMapModal)
    
  $('#mapModal').on('shown', ->
    center = root.map.getCenter();
    google.maps.event.trigger(root.map, 'resize')
    root.map.setCenter(center)
  )
)