
//handleFavorite.js contains jQuery to handle events when user tries to favorite or unfavorite item


////THIS IS ALL USELESS CODE!!!!! but saving it here to help with logic since its similar

//get value of rating clicked and send post request with
//tt and rating value
// $('#movies-list').on('click', 'input[name=stars]', function (evt) {
//     if (!progressive_on) return;
//     var tt = $(this).closest('tr').attr('data-tt');
//     var ratingVal = $(this).attr('value');
//     $(this).css('font-weight', 'bold');
//     $.post('/rateMovieAjax', { 'tt': tt, 'rating': ratingVal }, updateSingleRating);
// });

$("input[type=submit]").hide();

var fav_url = "{{url_for('favorite')}}";

// delegated event handler
$("#job-list").on('click','input', function (event) {
    $(this).css('color','orange');
    var link = $(this).closest('tr').attr('data-tt');
    console.log(link);
    // $(this).css('background-color', '#4CAF50');
    $.post(fav_url, {'link' : link}, updateSingleJob);
});


function updateSingleJob(resp) {
    var link = resp['link'];
    $('[data-tt=' + link + ']')
        .attr('.submit').css('background-color','4CAF50');
};

//helper function to display new average rating
// function updateSingleRating(resp) {
//     var tt = resp['tt'];
//     var updatedRating = resp['avgRating'];
//     $('[data-tt=' + tt + ']')
//         .find('.avgrating').text(updatedRating);
// };

//button to turn progressive enhancement on/off
$("#progressive_enhancement").on('click', function () {
    if (progressive_on) {
        // turn it off
        $("input[name=stars],input[type=submit]").show();
        $("#progressive_enhancement").text('Turn on Progressive Enhancement');
        progressive_on = false;
    } else {
        // turn it on
        $("input[name=stars],input[type=submit]").hide();
        $("#progressive_enhancement").text('Turn off Progressive Enhancement');
        progressive_on = true;
    }
});