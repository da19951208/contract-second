$(function(){
    // username field event
    $('#username')
        .change(function(){
            $('#password').val('');
        })
        .keydown(function(event){
            if (event.keyCode == 13){
                $('#password').focus();
            }
        });

    // btn event
    $('#loginBtn').click(function(event){
        login();
    });

    $('#resetBtn').click(function(event){
        $('#username').val('').focus();
        $('#password').val('');
    });

});

function login(){
    var username = $('#username').val(),
        password = $('#password').val();
    username = $.trim(username);
    var loginBtn = $('#loginBtn');
    loginBtn.attr("disabled", true);

    $.ajax({
        type : "POST",
        dataType : 'json',
        data : {
            j_username: username,
            j_password: password
        },
        url : "checkLogin",
        success : function(result){
            if(result)  {
                window.location.href = "index.jsp";
            }else {
                $('#username').focus();
                loginBtn.removeAttr("disabled");
                alert('failed');
            }
        },
        error: function(err){
            loginBtn.removeAttr("disabled");
        }
    });
};