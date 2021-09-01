window.onload=(function (){
    $.ajax({
        action: '/loadData',
        success: function (response,textState, xhr) {
            console.log(response)
        }
    });
})
