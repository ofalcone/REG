/**
 * Created by Orlando on 27/07/2017.
 */

function myCheck() {

    $('#tablefarmaci').find('tr').each(function () {
        var row = $(this);
        if (row.find('input[type="checkbox"]').is(':checked') && row.find(".ricetta").text() == "1") {
            $("#toShow").show();
            alert("ok");
        }
    });
}