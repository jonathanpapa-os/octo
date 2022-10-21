global.$ = require("jquery")

let $options = $("#appointment_day > option").clone();
$('#for_cloning_select').append($options);

let string = document.getElementById('appointment_dates').innerHTML;
let array = string.split(",");

$("#appointment_month").change(function(){
    let date_to_remove = [];
    let $cloned_options = $("#for_cloning_select > option").clone();
    $.each( array, function( key, value ) {
        let fullname = value.split("-");
        let year;
        let day_and_time;
        year=fullname[0];
        day_and_time=fullname[fullname.length-1];
        for(let i=1; i < fullname.length-1; i++) {
            let month = month +" "+ fullname[i];
            let i = day_and_time.indexOf(' ');
            let day = day_and_time.slice(0, i).trim();
            let time = day_and_time.slice(i + 1, day_and_time.length).trim();
            date_to_remove.push(month+','+day+','+time+','+year);
            let appointment_options = $('#appointment_day option');
            let appointment_options_selected = $('#appointment_day option:selected');


            $.each(date_to_remove, function( key, value ) {
                appointment_options.remove();
                $('#appointment_day').append($cloned_options);
                $("#appointment_day").val('1');
                let text = value + '';
                const to_remove = text.split(",");
                let months_30 = ['March', 'April', 'June', 'August', 'September', 'November'];
                let replaced_months = to_remove[0].replace(/\s/g, '')
                let replaced_day = to_remove[1].replace(/\s/g, '')
                if(appointment_options_selected.val()=== replaced_months){
                    $("#appointment_day option[value='"+replaced_day+"']").remove();
                }

                if(appointment_options_selected.val() === 'February'){
                    let list = ["31", "30", "29"];
                    $('#appointment_day option').filter(function () {
                        return $.inArray(this.value, list) !== -1
                    }).remove();
                }

                if(jQuery.inArray($( "#appointment_month option:selected" ).val(), months_30) !== -1) {
                    let list = ["31"];
                    $('#appointment_day option').filter(function () {
                        return $.inArray(this.value, list) !== -1
                    }).remove();
                }


            });
        }
    });
});