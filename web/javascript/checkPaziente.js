/**
 * Created by Orlando on 26/07/2017.
 */

$(function() {
    $("input[type='number']").change(function() {
        var domObj = $(this).parents("tr").find(".bs-checkbox");
        var val = domObj.val();
        var x = val.split(";");
        var nome = x[0];
        var qty = $(this).val();
        domObj.val(nome + ";" + qty);
        //console.log(nome + ";" + qty);
    });
});
