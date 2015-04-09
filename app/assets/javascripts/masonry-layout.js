$( document ).ready( function(){
  $( '.masonry-container' ).masonry( 
    { 
      columnWidth: 80,
      itemSelector: '.box' 
    } 
  ).imagesLoaded(function(){
    $( '.masonry-container' ).masonry('reload');
  });
});
