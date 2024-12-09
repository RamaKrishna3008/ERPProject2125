<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student st = (Student) session.getAttribute("student");
    if (st == null) {
        response.sendRedirect("/SessionExpiry");
        return ;
    }
%>
<html>
<head>
    <title>SHS University - Fee Management</title>
    <link rel="icon" href="/images/university-icon.png">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
   body {
    font-family: 'Inter', 'Roboto', sans-serif;
    background: linear-gradient(135deg, #f0f4f8 0%, #e6f2ff 100%);
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: #1a365d;
    background-attachment: fixed;
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #2c5282;
    font-weight: 700;
    font-size: 2.5rem;
    text-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    letter-spacing: -0.5px;
}

form {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 16px;
    box-shadow: 
        0 15px 35px rgba(0, 0, 0, 0.05), 
        0 5px 15px rgba(0, 0, 0, 0.03);
    width: 100%;
    max-width: 450px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    border: 1px solid #e2e8f0;
}

form::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 6px;
    background: linear-gradient(to right, #3182ce, #4299e1);
}

input[type="number"],
input[type="text"] {
    width: 100%;
    padding: 15px;
    margin: 15px 0;
    border: 2px solid #e2e8f0;
    border-radius: 10px;
    font-size: 16px;
    background-color: #f7fafc;
    transition: all 0.3s ease;
    box-sizing: border-box;
    color: #2d3748;
}

input[type="number"]:focus,
input[type="text"]:focus {
    border-color: #4299e1;
    outline: none;
    box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
}

button {
    background: linear-gradient(to right, #3182ce, #4299e1);
    color: white;
    padding: 16px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
    font-weight: 600;
    transition: all 0.3s ease;
    letter-spacing: 0.5px;
    position: relative;
    overflow: hidden;
    margin-top: 20px;
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
}

.payment-summary {
    margin-top: 30px;
    text-align: center;
    font-size: 18px;
    color: #2c5282;
    background-color: rgba(66, 153, 225, 0.05);
    padding: 15px;
    border-radius: 12px;
    max-width: 450px;
    width: 100%;
    border: 1px solid #e2e8f0;
}

.payment-summary span {
    font-weight: bold;
    color: #e53e3e;
}

a {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #3182ce;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
    padding: 10px;
    border-radius: 8px;
}

a:hover {
    background-color: rgba(49, 130, 206, 0.1);
    color: #4299e1;
    transform: translateY(-2px);
}

a:focus {
    outline: 2px solid rgba(66, 153, 225, 0.3);
    outline-offset: 2px;
}

</style>
</head>
<body>
    <h1>Pay Fee</h1>
    <form id="paymentForm">
        <input type="number" step="0.1" id="feeAmount" value="<%=st.getFeeDue()%>" required>
        <input type="text" id="studentId" value="<%=st.getId()%>" readonly>
        <button type="button" onclick="payNow()">Pay Now</button>
        <a href="FeePayment">Back</a>
    </form>

    <div class="payment-summary">
        <p>Total Due: <span>₹<%=st.getFeeDue()%></span></p>
    </div>

    <script>
    function payNow() {
        const feeAmount = document.getElementById('feeAmount').value;
        const studentId = document.getElementById('studentId').value;

        // Step 1: Create a Razorpay order by calling the backend /createOrder endpoint
        fetch('/Student/createOrder', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                feeAmount: feeAmount,
                studentId: studentId
            })
        })
        .then(res => res.json())
        .then(order => {
            const orderId = order.id;
            const options = {
                key: 'rzp_test_d3yeHrfHXiLZIN', // Replace with your Razorpay key
                amount: feeAmount * 100, // Amount in paise
                currency: "INR",
                name: "SHS University",
                description: "Fee Payment",
                order_id: orderId, // Use the generated order ID
                image: '/images/university-icon.png', // Your image URL here
                handler: function (response) {
                    // Send payment info to the server after successful payment
                    fetch('/Student/savePayment', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            paymentId: response.razorpay_payment_id,
                            orderId: response.razorpay_order_id,
                            studentId: studentId,
                            feeAmount: feeAmount
                        })
                    })
                    .then(res => res.json())
                    .then(data => alert("Payment Successful!"))
                    .catch(err => console.error("Error:", err));
                },
                prefill: {
                    name: "<%=st.getName()%>",
                    email: "<%=st.getParentEmail()%>",
                    contact: "<%=st.getContact()%>"
                },
                theme: {
                    color: "#3399cc"
                }
            };
            const rzp = new Razorpay(options);
            rzp.open();
        })
        .catch(err => console.error("Error creating Razorpay order:", err));
    }
</script>
</body>
</html>
