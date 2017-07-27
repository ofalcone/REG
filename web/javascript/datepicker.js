/**
 * Created by Orlando on 26/07/2017.
 */
$(document).ready(function(){
        var date_input=$('input[name="date"]');
        var container=$(".bootstrap-iso form").lenght>0 ? $(".bootstrap-iso form").parent() : "body";
        date_input.datepicker({
            format: 'mm/dd/yyyy',
            container : container,
            todayHighlight: true,
            autoclose: true,
        })
    }
)
