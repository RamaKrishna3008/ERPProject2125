<%@ page import="com.klef.jfsd.sdp.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Student st = (Student) session.getAttribute("student");
if (st == null) {
    response.sendRedirect("/SessionExpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHS University - Fee Management</title>
    <link rel="icon" href="/images/university-icon.png">
    <link rel="stylesheet" type="text/css" href="/Styles/StudentNavBar.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1e90ff;
            --secondary-color: #ff6f61;
            --background-color: #f0f8ff;
            --text-color: #2d3748;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: var(--white);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .fee-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .fee-due {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            text-align: center;
        }

        .btn-pay {
            background-color: var(--secondary-color);
            color: var(--white);
        }

        .btn-pay:hover {
            background-color: #e65c4f;
        }

        .btn-view {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-view:hover {
            background-color: #1c7ed6;
        }

        .fee-details {
            background-color: #f8f9fa;
            padding: 1rem;
            border-radius: 10px;
            margin-top: 1rem;
        }

        .fee-details h2 {
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <jsp:include page="studentnavbar.jsp"></jsp:include>

    <div class="container">
        <div class="fee-header">
            <h1>Fee Management</h1>
            <div class="fee-due">
                Fee Due: ₹<%=st.getFeeDue() %>
            </div>
        </div>

        <div class="action-buttons">
            <a href="PayFee" class="btn btn-pay">Pay Now</a>
            <a href="MyPayments" class="btn btn-view">View Payment History</a>
        </div>

        <div class="fee-details">
            <h2>Fee Details</h2>
            <p>Fees For This Semester: ₹20,000</p>
            <p>Remaining Balance: ₹<%=st.getFeeDue() %></p>
        </div>
    </div>
</body>
</html>