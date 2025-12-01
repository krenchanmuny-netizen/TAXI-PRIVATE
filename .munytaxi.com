
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNYTAXI - Fast & Reliable Booking</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header>
        <div class="logo">MUNYTAXI</div>
        <nav>
            <a href="#">Home</a>
            <a href="#">Services</a>
            <a href="#">Contact</a>
        </nav>
    </header>

    <main class="hero-section">
        <div class="content-left">
            <h1>Your Reliable Ride, Anytime, Anywhere.</h1>
            <p>Book your **MUNYTAXI** in seconds. Fast, safe, and transparent pricing guaranteed.</p>
            <a href="#booking-form-section" class="btn-primary">Book Now</a>
        </div>

        <div class="booking-card" id="booking-form-section">
            <h2>Book Your Ride</h2>
            <form id="bookingForm">
                <div class="input-group">
                    <i class="fas fa-location-dot"></i>
                    <input type="text" id="pickup" placeholder="Pickup Location" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-flag-checkered"></i>
                    <input type="text" id="destination" placeholder="Destination" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-calendar-alt"></i>
                    <input type="date" id="date" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-clock"></i>
                    <input type="time" id="time" required>
                </div>
                
                <button type="submit" class="btn-submit">Find My Taxi</button>
            </form>
        </div>
    </main>

    <div id="confirmation-modal" class="modal">
        <div class="modal-content">
            <i class="fas fa-check-circle modal-icon"></i>
            <h3>Booking Confirmed!</h3>
            <p>Your **MUNYTAXI** is on its way. Details have been sent to your email.</p>
            <div class="booking-details">
                <p><strong>Route:</strong> <span id="modal-route"></span></p>
                <p><strong>Time:</strong> <span id="modal-time"></span></p>
            </div>
            <button class="btn-close" onclick="closeModal()">Close</button>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>

* General Styling */
:root {
    --primary-color: #FFC300; /* A vibrant yellow/gold for the brand */
    --secondary-color: #2C3E50; /* Dark blue/grey for text and background contrast */
    --text-color: #333;
    --white: #ffffff;
    --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background-color: #f4f7f6;
    color: var(--text-color);
}

/* Header/Navigation */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 5%;
    background-color: var(--secondary-color);
    box-shadow: var(--box-shadow);
}

.logo {
    font-size: 1.8em;
    font-weight: 700;
    color: var(--primary-color);
    letter-spacing: 1px;
}

nav a {
    text-decoration: none;
    color: var(--white);
    margin-left: 30px;
    font-weight: 500;
    transition: color 0.3s;
}

nav a:hover {
    color: var(--primary-color);
}

/* Hero Section */
.hero-section {
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 80px 5%;
    min-height: 80vh;
    background: linear-gradient(135deg, #FFD700 0%, var(--primary-color) 100%);
    color: var(--secondary-color);
}

.content-left {
    max-width: 500px;
}

.content-left h1 {
    font-size: 3.5em;
    margin-bottom: 15px;
    line-height: 1.1;
    color: var(--secondary-color);
}

.content-left p {
    font-size: 1.2em;
    margin-bottom: 30px;
    font-weight: 500;
}

/* Buttons */
.btn-primary {
    background-color: var(--secondary-color);
    color: var(--white);
    padding: 12px 30px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: 600;
    transition: background-color 0.3s, transform 0.2s;
    display: inline-block;
}

.btn-primary:hover {
    background-color: #3d566e;
    transform: translateY(-2px);
}

.btn-submit {
    width: 100%;
    padding: 15px;
    background-color: var(--primary-color);
    color: var(--secondary-color);
    border: none;
    border-radius: 5px;
    font-size: 1.1em;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-submit:hover {
    background-color: #e6b100;
}

/* Booking Card */
.booking-card {
    background-color: var(--white);
    padding: 40px;
    border-radius: 10px;
    box-shadow: var(--box-shadow);
    width: 350px;
}

.booking-card h2 {
    color: var(--secondary-color);
    text-align: center;
    margin-bottom: 25px;
    border-bottom: 2px solid var(--primary-color);
    padding-bottom: 10px;
}

.input-group {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 5px 10px;
}

.input-group i {
    color: var(--primary-color);
    margin-right: 10px;
    font-size: 1.2em;
}

.input-group input {
    flex-grow: 1;
    border: none;
    padding: 10px 0;
    font-size: 1em;
    outline: none;
}

/* --- Confirmation Modal Styling --- */
.modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 100;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.6); /* Black background with opacity */
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: var(--white);
    margin: auto;
    padding: 40px;
    border-radius: 10px;
    width: 90%;
    max-width: 450px;
    text-align: center;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    animation: fadeIn 0.3s;
}

@keyframes fadeIn {
    from {opacity: 0; transform: scale(0.9);}
    to {opacity: 1; transform: scale(1);}
}

.modal-icon {
    font-size: 4em;
    color: #4CAF50; /* Green checkmark */
    margin-bottom: 20px;
    display: block;
}

.modal-content h3 {
    color: var(--secondary-color);
    margin-bottom: 15px;
    font-size: 1.8em;
}

.booking-details {
    background-color: #f7f7f7;
    padding: 15px;
    border-radius: 5px;
    margin-top: 20px;
    text-align: left;
    border-left: 5px solid var(--primary-color);
}

.booking-details p {
    margin: 5px 0;
}

.btn-close {
    background-color: var(--secondary-color);
    color: var(--white);
    padding: 10px 25px;
    border: none;
    border-radius: 5px;
    margin-top: 30px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-close:hover {
    background-color: #3d566e;
}

/* Responsive adjustments */
@media (max-width: 900px) {
    .hero-section {
        flex-direction: column;
        padding-top: 40px;
    }

    .content-left {
        text-align: center;
        margin-bottom: 40px;
    }

    .content-left h1 {
        font-size: 2.5em;
    }
}
document.getElementById('bookingForm').addEventListener('submit', function(event) {
    // 1. Prevent the default form submission (which would reload the page)
    event.preventDefault();

    // 2. Get values from the form inputs
    const pickup = document.getElementById('pickup').value;
    const destination = document.getElementById('destination').value;
    const date = document.getElementById('date').value;
    const time = document.getElementById('time').value;

    // 3. Update the Confirmation Modal with the booking details
    const route = `${pickup} to ${destination}`;
    const dateTime = `${date} at ${time}`;

    document.getElementById('modal-route').textContent = route;
    document.getElementById('modal-time').textContent = dateTime;

    // 4. Display the Confirmation Modal
    document.getElementById('confirmation-modal').style.display = 'flex';

    // *In a real-world scenario, you would send this data to a server here*
    console.log(`Booking submitted! Pickup: ${pickup}, Destination: ${destination}, Time: ${dateTime}`);

    // 5. Clear the form (optional)
    this.reset();
});

// Function to close the modal
function closeModal() {
    document.getElementById('confirmation-modal').style.display = 'none';
}
