<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="../../../resources/css/common.css" rel="stylesheet">
    <link href="../../../resources/css/login.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <meta name="keywords" content="Login">
    <meta name="keywords" content="Sign in">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!--Bootstrap Css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!--Font-aweome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        @media (min-width:1200px) {
            .container{
                max-width:60%;
            }
        }

    </style>
    <!--Custom Css-->
</head>
<body>


    <header>
        <%@ include file="../common/header.jsp" %>
    </header>

<section class="login_section">
    <div class="container outer_container accounts_container">
        <div class="row h-100">
            <div class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
                <div class="accounts_image w-100 h-100">
                    <img src="https://img.freepik.com/free-vector/accounting-and-audit-concept_1284-65155.jpg?t=st=1694016228~exp=1694016828~hmac=c653dfbb1f5c945da89845ff0ca15c963330fe07e3656672998cbb66bd497653" alt="accounts_image" class="img-fluid w-100 h-100" />
<%--                    <img class="imgLogo" src="https://mir-s3-cdn-cf.behance.net/project_modules/1400/ad7e21133290575.61ba2672d7ab4.png" alt="accounts_image" >--%>
<%--                    <img class="imgLogo" src="../../../resources/img/loginimage.jpg" alt="accounts_image" >--%>

                </div>
                <!--accounts_image-->
            </div>
            <!--account_col-->
            <div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">

<%--                form action="/login" method="post"--%>
<%--                <input type="submit" value="Login">--%>

                <!--accounts_forms-->
                <div class="accounts_forms  w-100 h-100" id="login">
                    <div class="title  mt-4 p-4 w-100">
                        <h1>로그인</h1>
                    </div>
                    <!--title-->
                    <form action="/login" method="post" name="form" class="form  w-100 p-4" id="form">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" class="form-control" id="email" onfocus="labelUp(this)" onblur="labelDown(this)" required />
                        </div>
                        <div class="form-group">
                            <label for="login_password">Password</label>

                            <input type="password" name="password" class="form-control" id="login_password" onfocus="labelUp(this)" onblur="labelDown(this)" required />
                        </div>
                        <div class="form-group mb-0">
                            <button type="submit" value="login" class="btn btn-primary register_btn w-100">로그인</button>
<%--                            <input type="submit" value="login">--%>
                        </div>
                    </form>

                    <div class="already_member_box d-flex justify-content-between px-4">

<%--                        <span class="text-center">Forgot password</span>--%>
                    </div>
                </div>
                <!--accounts_forms-->
            </div>
            <!--account_col-->
        </div>
        <!--row-->
    </div>
    <!--accounts_container-->
    <c:if test="${not empty msg}">
        <p style="color: red;">${msg}</p>
    </c:if>

</section>


<!--login_section-->

    <footer>
        <%@ include file="../common/footer.jsp" %>
    </footer>
<script>

    // call when focus on input
    function labelUp(input){
        input.parentElement.children[0].setAttribute("class", "change_label");
    }

    // call when focus out on input
    function labelDown(input){
        if(input.value.length === 0){
            input.parentElement.children[0].classList.remove("change_label");
        }

    }

    // show & hide password
    var eye_icon_signup = document.getElementById('eye_icon_signup');
    var eye_icon_login = document.getElementById('eye_icon_login');
    var sign_up_password = document.getElementById("signup_password");
    var login_password = document.getElementById("login_password");
    eye_icon_signup.addEventListener('click', ()=>{
        hideAndShowPass(eye_icon_signup, signup_password);
    });
    eye_icon_login.addEventListener('click', ()=>{
        hideAndShowPass(eye_icon_login, login_password);
    });

    const hideAndShowPass = (eye_icon, password) => {
        if(eye_icon.classList.contains("fa-eye-slash")){
            eye_icon.classList.remove('fa-eye-slash');
            eye_icon.classList.add('fa-eye');
            password.setAttribute('type', 'text');

        }
        else{
            eye_icon.classList.remove('fa-eye');
            eye_icon.classList.add('fa-eye-slash');
            password.setAttribute('type', 'password');
        }
    };


    // Sign Up & Sign In Toggle
    let to_signup = document.getElementById('to_signup');
    let to_login = document.getElementById('to_login');
    to_signup.addEventListener('click', function(){
        let_change();
    });
    to_login.addEventListener('click', function(){
        let_change();
    });
    const let_change = () => {
        let login = document.getElementById('login');
        login.classList.toggle('login_form');
        let signup = document.getElementById('signup');
        signup.classList.toggle('signup_form');
    }

</script>

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--Custom Js-->
<script type="text/javascript" src="js/app.js"></script>

</body>

</html>




</html>