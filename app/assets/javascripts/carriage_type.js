$(document).ready(function() {
    $('select#carriage_type').change(function() {

        var option = $(this).find('option:selected').text();
        console.log(option);

        switch(option)
        {
            case 'Saloon':
                $('div#bottom').show();
                $('div#top').show();
                $('div#economy').hide();
                $('div#sitting').hide();
                break;
            case 'Economy':
                $('div#bottom').show();
                $('div#top').show();
                $('div#economy').show();
                $('div#sitting').hide();
                break;
            case 'Sleeping':
                $('div#bottom').show();
                $('div#top').hide();
                $('div#economy').hide();
                $('div#sitting').hide();
                break;
            case 'Sitting':
                $('div#bottom').hide();
                $('div#top').hide();
                $('div#economy').hide();
                $('div#sitting').show();
                break;
        }
    });
});