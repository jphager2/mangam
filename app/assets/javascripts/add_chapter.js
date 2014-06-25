function hideThis(parentIdent) {
  $(parentIdent).children().hide();
};

function showThis(parentIdent) {
  $(parentIdent).children().show();
};

var input;
var match;

$(document).ready( function(){
  hideThis(".startHidden");

  $( "#chapter_image_url" ).keyup(function() {
    function checkUrl() {
      input = $( "#chapter_image_url" );

      function checkMatch(match) {
        return (match && match.length >= 3);
      };

      function insertValues(match) {
        var manga = match[1].replace(/\-/g,' ');
        var chapter = match[2];
        $( "#chapter_manga"  ).val(manga);
        $( "#chapter_number" ).val(chapter);
      };
      
      function mangaReader() {
        //if it matches a regexp
        reg = /(?:mangareader\.net\/)((?:\w|\-)+)\/(\d+)/;
        match = input.val().match(reg); 
        if (checkMatch(match)) {insertValues(match);}
      };

      // Execute regex functions
      mangaReader();
    };
    checkUrl();
    showThis('.startHidden');
  });
});
