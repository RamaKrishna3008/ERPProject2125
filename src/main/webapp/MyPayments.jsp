<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<html> 
<head> 
<title>SHS University</title>
    <link rel="icon" href="/images/university-icon.png">
<style>
:root {
    --primary-color: #007bff;     /* Vibrant Blue */
    --secondary-color: #6c757d;   /* Muted Gray */
    --accent-color: #28a745;      /* Green Accent */
    --background-light: #f8f9fa;  /* Light Background */
    --text-dark: #2c3e50;         /* Dark Slate */
    --transition-speed: 0.3s;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
    background: linear-gradient(135deg, #f4f7fa 0%, #f1f3f5 100%);
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    line-height: 1.6;
    color: var(--text-dark);
    padding: 40px 20px;
}

.form-container {
    background-color: white;
    padding: 50px;
    border-radius: 20px;
    box-shadow: 
        0 20px 50px rgba(0, 0, 0, 0.1), 
        0 10px 20px rgba(0, 0, 0, 0.05);
    width: 90%;
    max-width: 1200px;
    position: relative;
    overflow: hidden;
    transition: all 0.4s ease;
    margin-top: 50px;
    margin-left: 230px;
}

.form-container::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at center, rgba(0, 123, 255, 0.03) 0%, transparent 70%);
    transform: rotate(-45deg);
    z-index: 1;
    pointer-events: none;
}

h2 {
    text-align: center;
    color: var(--text-dark);
    margin-bottom: 40px;
    font-weight: 700;
    letter-spacing: -0.5px;
    position: relative;
    font-size: 2rem;
}

h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    width: 80px;
    height: 4px;
    background-color: var(--primary-color);
    transform: translateX(-50%);
    border-radius: 2px;
}

/* Enhanced Table Styles */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 30px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
    border-radius: 10px;
    overflow: hidden;
    background-color: #fff;
}

th, td {
    padding: 18px 15px;
    text-align: center;
    border-bottom: 1px solid #e9ecef;
    transition: all var(--transition-speed) ease;
}

th {
    background-color: var(--primary-color);
    color: white;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 0.9rem;
}

tr:nth-child(even) {
    background-color: rgba(0, 123, 255, 0.02);
}

tr:hover {
    background-color: rgba(0, 123, 255, 0.05);
}

td {
    color: var(--text-dark);
}

tr td:hover {
    background-color: rgba(0, 123, 255, 0.1);
    cursor: pointer;
}



/* Responsive Design */
@media screen and (max-width: 1024px) {
    .form-container {
        width: 95%;
        padding: 30px 20px;
    }

    table {
        font-size: 0.9rem;
    }

    th, td {
        padding: 15px 10px;
    }
}

@media screen and (max-width: 480px) {
    table {
        font-size: 0.8rem;
    }

    th, td {
        padding: 12px 8px;
    }
}

/* Scrollbar Customization */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: var(--primary-color);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: #0056b3;
}

/* Message Styling */
h1[align="center"] {
    text-align: center;
    color: var(--secondary-color);
    padding: 20px;
    background-color: var(--background-light);
    border-radius: 10px;
    margin-top: 50px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
</style>

<link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
</head>
<body>
<%@include file="studentnavbar.jsp" %>

<c:if test="${msg != null}">
    <h1 align="center">${msg}</h1>
</c:if>

<c:if test="${msg == null}">
<div class="form-container">

    

    <h2>My Fee Payments</h2>

    <table>
        <tr>
            <th>S no</th>
            <th>Amount</th>
            <th>Payment Status</th>
            <th>Payment Date</th>
        </tr>

        <c:forEach items="${fee}" var="fee" varStatus="status">
            <tr>
                <td><c:out value="${status.index+1}" /></td>
                <td><c:out value="${fee.amount}" /></td>
                <td><c:out value="${fee.paymentStatus}" /></td>
                <td><c:out value="${fee.paymentDate}" /></td>                
            </tr>
        </c:forEach>
    </table>
    </div>
    </c:if>

</body> 
</html>
