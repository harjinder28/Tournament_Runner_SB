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
            </ul></div>
        </div>
    </nav>
