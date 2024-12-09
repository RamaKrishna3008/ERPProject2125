
<%@page import="com.klef.jfsd.sdp.model.Faculty"%>
<%
Faculty f = (Faculty)session.getAttribute("faculty");
if(f==null)
{
	response.sendRedirect("/SessionExpiry");
	return ;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
    <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    background-color: #f1f5f9;
}

.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    width: 260px;
    background-color: #1F2937;
    padding: 20px;
    transition: all 0.4s ease;
    box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
}

.sidebar h2 {
    color: white;
    font-size: 24px;
    font-weight: 600;
    letter-spacing: -0.4px;
    text-align: center;
    padding: 15px 0;
    margin-bottom: 30px;
    position: relative;
}

.sidebar h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background-color: black;
    border-radius: 10px;
}

.dropdown {
    position: relative;
    margin-bottom: 15px;
}

.dropdown > a {
    display: flex;
    align-items: center;
    padding: 12px 20px;
    color: #F9FAFB;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    border-radius: 8px;
    transition: all 0.3s ease;
    cursor: pointer;
    background-color:#1F2937;
}

.dropdown > a:hover {
    background-color:#374151 ;
    color: #3B82F6;
    transform: translateX(5px);
}

.dropdown-menu {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
    margin-left: 20px;
    margin-top: 5px;
}

.dropdown:hover .dropdown-menu {
    max-height: 200px;
}

.dropdown-menu a {
    display: block;
    padding: 10px 20px;
    color: #6B7280;
    text-decoration: none;
    font-size: 14px;
    font-weight: 400;
    border-radius: 6px;
    transition: all 0.3s ease;
    margin: 5px 0;
}

.dropdown-menu a:hover {
    background: rgba(59, 130, 246, 0.1); 
    color: #3B82F6;
    transform: translateX(5px);
}

.dropdown > a::before {
    content: '';
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-right: 10px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    opacity: 0.8;
}

.profile-pic-container {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 100;
}

.profile-pic {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #1e3a8a;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Custom icons for each menu */
.dropdown:nth-child(2) > a::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253' /%3E%3C/svg%3E");
}

.dropdown:nth-child(3) > a::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z' /%3E%3C/svg%3E");
}

.dropdown:nth-child(4) > a::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z' /%3E%3C/svg%3E");
}

.dropdown:nth-child(5) > a::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1' /%3E%3C/svg%3E");
}

.toast {
    visibility: hidden;
    min-width: 250px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 5px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    top: 20px;
    right: 20px;
    font-size: 17px;
}

.toast.show {
    visibility: visible;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

.toast.success {
    background-color: green;
}

.toast.failure {
    background-color: red;
}

@keyframes fadein {
    from {top: 0; opacity: 0;}
    to {top: 20px; opacity: 1;}
}

@keyframes fadeout {
    from {top: 20px; opacity: 1;}
    to {top: 0; opacity: 0;}
}
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>University</h2>
        <div class="dropdown">
            <a>Courses</a>
            <div class="dropdown-menu">
                <a href="viewFacultyMappedCoursesHome">View Courses</a>
            </div>
        </div>
        <div class="dropdown">
            <a>Student</a>
            <div class="dropdown-menu">
                <a href="ViewStudents_Faculty">View Students</a>
            </div>
        </div>
         <div class="dropdown">
            <a>Profile</a>
            <div class="dropdown-menu">
                <a href="UpdateFacultyProfile">View Profile</a>
            </div>
            </div>
        <div class="dropdown">
            <a href="/Logout">Logout</a>
        </div>
    </div>
   <div class="profile-pic-container">
    <img src="/Admin/displayfacultyimage?id=<%=f.getId()%>" class="profile-pic" >
	</div>
    <div id="toast" class="toast"></div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                const toast = document.getElementById("toast");
                toast.textContent = "Login Successful";
                
                if (message.includes("success")) {
                    toast.classList.add("show", "success");
                } else {
                    toast.classList.add("show", "failure");
                }
                
                setTimeout(() => {
                    toast.classList.remove("show", "success", "failure");
                }, 3000);
            }
        });
    </script>
</body>
</html>
