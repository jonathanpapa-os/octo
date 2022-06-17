var $options = $("#appointment_day > option").clone();
$('#for_cloning_select').append($options);

var string = document.getElementById('appointment_dates').innerHTML;
var array = string.split(",");

$("#appointment_month").change(function(){
    var date_to_remove = [];
    var $cloned_options = $("#for_cloning_select > option").clone();
    $.each( array, function( key, value ) {
        var fullname = value.split("-");
        year = '';
        month = '';
        day_and_time = '';
        year=fullname[0];
        day_and_time=fullname[fullname.length-1];
        for(var i=1; i < fullname.length-1; i++) {
            month =  month +" "+ fullname[i];
            var i = day_and_time.indexOf(' ');
            var day = day_and_time.slice(0, i).trim();
            var time = day_and_time.slice(i + 1, day_and_time.length).trim();
            date_to_remove.push(month+','+day+','+time+','+year);

            $.each(date_to_remove, function( key, value ) {
                $('#appointment_day option').remove();
                $('#appointment_day').append($cloned_options);
                $("#appointment_day").val('1');
                let text = value + '';
                const to_remove = text.split(",");
                var months_30 = ['March', 'April', 'June', 'August', 'September', 'November'];
                var replaced_months = to_remove[0].replace(/\s/g, '')
                var replaced_day = to_remove[1].replace(/\s/g, '')
                if($( "#appointment_month option:selected" ).val()== replaced_months){
                    $("#appointment_day option[value='"+replaced_day+"']").remove();
                }

                if($( "#appointment_month option:selected" ).val() == 'February'){
                    var list = ["31", "30", "29"];
                    $('#appointment_day option').filter(function () {
                        return $.inArray(this.value, list) !== -1
                    }).remove();
                }

                if(jQuery.inArray($( "#appointment_month option:selected" ).val(), months_30) != -1) {
                    var list = ["31"];
                    $('#appointment_day option').filter(function () {
                        return $.inArray(this.value, list) !== -1
                    }).remove();
                }


            });
        }
    });
});