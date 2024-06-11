<link rel="stylesheet" type="text/css" href="/css/Navbar.css">

<nav>   
        <div class="container">
            <h1 class="logo">GMT</h1>
            
            <div class="mainnav">
            <ul>

                <li ><a class="active" href="/home">Home</a></li>
                <li><a href="/user/createTournament">Create Tournament</a></li>
                <li><a href="/user/viewTournament">View Tournament</a></li>
                </ul>
                </div>
                <div class="logs">
            <ul>
                <li style="display:${isLogged?"none":"inline"};"><a href="/login">Login</a></li>
                <li style="display:${isLogged?"none":"inline"};"><a href="/signup">Sign Up</a></li>
                <img class="profile" src="https://c0.klipartz.com/pngpicture/987/118/gratis-png-iconos-de-computadora-iniciar-sesion-perfil-de-usuario.png" alt="user" style="display:${isLogged?"inline":"none"};">
                <div class="profile_dropdown" >
                    <ul id="dropDownUl">
                    <li><a href="/user/profile" >Profile</a></li>
                    <li><a href="/user/logout" >Logout</a></li>
                    </ul>
                </div>
            </ul>
        </div>
        </div>
    

    </nav>
    <script src="/js/Navbar.js" type="text/javascript"></script>
        
