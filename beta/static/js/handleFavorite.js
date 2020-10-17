
//handleFavorite.js contains jQuery to handle events when user tries to favorite or unfavorite item


$("input[type=submit]").hide();


// delegated event handler
$("#job-list").on('click','i', function (event) {
    $(this).closest('i').css('color','orange');
    var link = $(this).closest('tr').attr('data-tt');
    console.log(link);
    // $(this).css('background-color', '#4CAF50');
    $.post(fav_url, {'link' : link}, updateSingleJob);
});

// for saved list
$("#saved-list").on('click','i', function (event) {
    console.log('clicking recognized');
    $(this).closest('i').css('color','grey');
    var link = $(this).closest('tr').attr('data-tt');
    console.log(link);
    // $(this).css('background-color', '#4CAF50');
    $.post(saved_url, {'link' : link}, updateSingleJob);
});


function updateSingleJob(resp) {
    var link = resp.link;
    console.log('response is',resp);
    // $('[data-tt=' + link + ']').find('.favbutton').value(1);
};


// when loading the page, show which posts are already saved
function revealButtons(){
    var fave = document.getElementById('favelink').value;
    var internship = document.getElementById('intlink').value;
    console.log('fave: ' + fave);
    console.log('internship: ' + internship);
    console.log("revealBUttons");
    if (fave == internship){
        console.log("match");
        $("#saveicon").css("color","orange");
    }
}
