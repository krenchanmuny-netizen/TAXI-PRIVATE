<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Munytaxi - Your Reliable Ride</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <i class="fas fa-car" style="color: #ffc107;"></i>
            <span class="logo-text">munytaxi</span>
        </div>
        <nav class="nav-links">
            <a href="#" class="active">Home</a>
            <a href="#">Services</a>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#" class="btn-primary">Book now</a>
        </nav>
    </header>

    <main class="hero-section">
        <div class="hero-content">
            <div class="text-content">
                <h1>YOUR RELIABLE RIDE, ANYTIME AND ANYWHERE</h1>
                <button class="btn-secondary">BOOK NOW</button>
            </div>

            <div class="booking-form-card">
                <form class="booking-form">
                    <label for="pickup-location">Pickup Location</label>
                    <input type="text" id="pickup-location" placeholder="Pickup Location">

                    <label for="dropoff-location">Dropoff Location</label>
                    <input type="text" id="dropoff-location" placeholder="Dropoff Location">

                    <label for="pickup-date">Pickup Date</label>
                    <input type="date" id="pickup-date">

                    <label for="pickup-time">Pickup Time</label>
                    <input type="time" id="pickup-time">

                    <button type="submit" class="btn-primary form-submit-btn">Get Estimate</button>
                </form>
            </div>
        </div>
        </main>

    <section class="features-placeholder">
        <p>This is where the feature icons and testimonial sections would go.</p>
    </section>

</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Munytaxi - Your Reliable Ride</title>
    <!-- Load Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Load Font Awesome for the car icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    // Custom primary color based on user's request: #ffc107
                    colors: {
                        'muny-primary': '#ffc107',
                        'muny-dark': '#1a1a1a',
                        'muny-text-light': '#ffffff',
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    
    <style>
        /* Apply a clean font and dark background fallbacks */
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
        }

        /* Styling for the hero section background and overlay */
        .hero-bg {
            /* Placeholder background image. Replace with a real URL for production. */
            background-image: url('https://placehold.co/1920x700/000000/cccccc?text=Taxi+Cityscape');
            background-size: cover;
            background-position: center;
            position: relative;
        }
        
        /* Custom style for the 'TAXI' watermark inside the form, as Tailwind utility classes cannot set content easily */
        .booking-form-card::before {
            content: "TAXI";
            position: absolute;
            top: 5px;
            right: 15px;
            font-size: 50px;
            font-weight: 900;
            color: rgba(0, 0, 0, 0.1);
            transform: rotate(5deg);
            pointer-events: none;
            z-index: 0;
        }
    </style>
</head>

<body>

    <!-- Header / Navigation Bar -->
    <header class="fixed top-0 left-0 w-full bg-muny-dark/80 z-50 shadow-lg backdrop-blur-sm">
        <div class="flex justify-between items-center py-4 px-5 md:px-10 max-w-7xl mx-auto">
            <!-- Logo -->
            <div class="flex items-center text-2xl font-bold text-muny-text-light">
                <i class="fas fa-car mr-2 text-muny-primary"></i>
                <span class="lowercase">munytaxi</span>
            </div>

            <!-- Navigation Links -->
            <nav class="hidden md:flex items-center space-x-6 text-sm font-medium">
                <a href="#" class="text-muny-text-light hover:text-muny-primary transition duration-300">Home</a>
                <a href="#" class="text-muny-text-light hover:text-muny-primary transition duration-300">Services</a>
                <a href="#" class="text-muny-text-light hover:text-muny-primary transition duration-300">About Us</a>
                <a href="#" class="text-muny-text-light hover:text-muny-primary transition duration-300">Contact</a>
                <a href="#" class="bg-muny-primary text-muny-dark py-2 px-4 rounded-lg uppercase font-semibold hover:bg-yellow-500 transition duration-300 shadow-md">Book now</a>
            </nav>
            
            <!-- Mobile Menu Placeholder -->
            <button class="md:hidden text-muny-text-light text-xl">
                 <i class="fas fa-bars"></i>
            </button>
        </div>
    </header>

    <!-- Hero Section -->
    <main class="hero-bg h-[700px] flex items-center justify-center pt-20">
        <!-- Dark Overlay -->
        <div class="absolute inset-0 bg-muny-dark/50"></div>
        
        <!-- Hero Content Wrapper -->
        <div class="relative z-10 flex flex-col lg:flex-row justify-between items-center lg:items-start w-full max-w-7xl px-5 lg:px-10">
            
            <!-- Left Side: Text Content -->
            <div class="text-content text-center lg:text-left max-w-xl mb-10 lg:mb-0 pt-10 lg:pt-0">
                <h1 class="text-4xl sm:text-5xl lg:text-6xl font-extrabold text-muny-text-light leading-tight mb-6 uppercase drop-shadow-lg">
                    YOUR RELIABLE RIDE, ANYTIME AND ANYWHERE
                </h1>
                <button class="bg-muny-primary text-muny-dark py-4 px-10 text-lg font-semibold rounded-lg hover:bg-yellow-500 transition duration-300 shadow-xl">
                    BOOK NOW
                </button>
            </div>

            <!-- Right Side: Booking Form Card -->
            <div class="booking-form-card bg-white/95 p-6 sm:p-8 rounded-xl shadow-2xl w-full max-w-sm relative">
                <form id="booking-form" class="space-y-4">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6 z-10">Instant Ride Estimate</h2>
                    
                    <div class="relative">
                        <label for="pickup-location" class="block text-sm font-semibold text-gray-700 mb-1">Pickup Location</label>
                        <input type="text" id="pickup-location" placeholder="Enter Pickup Location" 
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-muny-primary focus:border-muny-primary transition duration-200">
                    </div>

                    <div class="relative">
                        <label for="dropoff-location" class="block text-sm font-semibold text-gray-700 mb-1">Dropoff Location</label>
                        <input type="text" id="dropoff-location" placeholder="Enter Dropoff Location" 
                               class="w-full p-3 border border-gray-300 rounded-lg focus:ring-muny-primary focus:border-muny-primary transition duration-200">
                    </div>

                    <div class="flex space-x-4">
                        <div class="w-1/2">
                            <label for="pickup-date" class="block text-sm font-semibold text-gray-700 mb-1">Pickup Date</label>
                            <input type="date" id="pickup-date" 
                                   class="w-full p-3 border border-gray-300 rounded-lg focus:ring-muny-primary focus:border-muny-primary transition duration-200">
                        </div>
                        <div class="w-1/2">
                            <label for="pickup-time" class="block text-sm font-semibold text-gray-700 mb-1">Pickup Time</label>
                            <input type="time" id="pickup-time" 
                                   class="w-full p-3 border border-gray-300 rounded-lg focus:ring-muny-primary focus:border-muny-primary transition duration-200">
                        </div>
                    </div>

                    <button type="submit" 
                            class="w-full bg-muny-primary text-muny-dark py-4 mt-6 text-lg font-bold rounded-lg uppercase hover:bg-yellow-500 transition duration-300 shadow-lg transform hover:scale-[1.01] active:scale-100">
                        Get Estimate
                    </button>
                    
                    <div id="message-box" class="mt-4 p-3 bg-gray-100 text-center text-sm text-gray-600 rounded-lg hidden"></div>
                </form>
            </div>
        </div>
    </main>

    <!-- Features Placeholder Section -->
    <section class="py-20 px-5 text-center bg-gray-50">
        <h2 class="text-3xl font-bold text-gray-800 mb-4">Why Choose Munytaxi?</h2>
        <p class="text-gray-600 max-w-3xl mx-auto mb-10">This section would feature our services, vehicle types, and customer testimonials.</p>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl mx-auto">
            <div class="p-6 bg-white rounded-xl shadow-lg hover:shadow-xl transition duration-300">
                <i class="fas fa-clock text-4xl text-muny-primary mb-4"></i>
                <h3 class="text-xl font-semibold mb-2">24/7 Availability</h3>
                <p class="text-sm text-gray-500">Book your ride anytime, day or night. We're always on call.</p>
            </div>
            <div class="p-6 bg-white rounded-xl shadow-lg hover:shadow-xl transition duration-300">
                <i class="fas fa-wallet text-4xl text-muny-primary mb-4"></i>
                <h3 class="text-xl font-semibold mb-2">Fixed Pricing</h3>
                <p class="text-sm text-gray-500">No surprises. Get an upfront quote before you confirm your ride.</p>
            </div>
            <div class="p-6 bg-white rounded-xl shadow-lg hover:shadow-xl transition duration-300">
                <i class="fas fa-star text-4xl text-muny-primary mb-4"></i>
                <h3 class="text-xl font-semibold mb-2">Professional Drivers</h3>
                <p class="text-sm text-gray-500">Our drivers are vetted, experienced, and focused on your safety.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-muny-dark text-muny-text-light py-8">
        <div class="max-w-7xl mx-auto px-5 text-center text-sm">
            &copy; 2025 Munytaxi. All rights reserved. | <a href="#" class="hover:text-muny-primary">Privacy Policy</a> | <a href="#" class="hover:text-muny-primary">Terms of Service</a>
        </div>
    </footer>

    <script>
        // Simple form submission handler (to prevent page reload and show a message)
        document.getElementById('booking-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const messageBox = document.getElementById('message-box');
            
            // Collect form data (minimal validation)
            const pickup = document.getElementById('pickup-location').value;
            
            if (pickup.trim() === '') {
                messageBox.textContent = "Please enter a pickup location to get an estimate.";
                messageBox.classList.remove('hidden');
                messageBox.classList.add('bg-red-100', 'text-red-700');
                return;
            }

            // Simulate booking attempt
            messageBox.textContent = "Estimate generated! Total fare will be calculated by the driver.";
            messageBox.classList.remove('hidden', 'bg-red-100', 'text-red-700');
            messageBox.classList.add('bg-green-100', 'text-green-700');

            // Clear message after a few seconds
            setTimeout(() => {
                messageBox.classList.add('hidden');
            }, 5000);
        });
    </script>
</body>
</html>

/* Import a standard, clean font like 'Poppins' or 'Inter' */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

/* --- General Reset & Variables --- */
:root {
    --primary-color: #ffc107; /* Yellow/Gold from the design */
    --text-light: #ffffff;
    --text-dark: #333333;
    --background-dark: #1a1a1a;
    --form-bg: rgba(255, 255, 255, 0.9); /* Slightly transparent white for the form */
    --dark-overlay: rgba(0, 0, 0, 0.4);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    color: var(--text-dark);
}

/* --- Navigation Bar --- */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 5%;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 10;
    background: var(--dark-overlay); /* Dark background for readability over the image */
}

.logo {
    font-size: 24px;
    font-weight: 700;
    color: var(--text-light);
    display: flex;
    align-items: center;
}

.logo i {
    margin-right: 5px;
}

.logo-text {
    /* Lowercase like in the image */
    text-transform: lowercase; 
}

.nav-links a {
    color: var(--text-light);
    text-decoration: none;
    margin-left: 25px;
    font-size: 14px;
    font-weight: 500;
    transition: color 0.3s;
}

.nav-links a:hover {
    color: var(--primary-color);
}

.nav-links .active {
    color: var(--primary-color);
}

.btn-primary {
    background: var(--primary-color);
    color: var(--background-dark);
    padding: 10px 20px;
    border-radius: 5px;
    text-transform: uppercase;
    font-weight: 600;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-primary:hover {
    background: #e6b000; /* Slightly darker yellow */
}


/* --- Hero Section --- */
.hero-section {
    position: relative;
    height: 700px; /* Adjust height as needed */
    width: 100%;
    /* Replace 'your-background-image.jpg' with the actual image URL */
    background: url('your-background-image.jpg') no-repeat center center/cover; 
    /* Add a dark overlay to make text readable, matching the design aesthetic */
    background-color: var(--dark-overlay); 
    background-blend-mode: multiply;
    display: flex;
    align-items: center;
    justify-content: center;
    padding-top: 80px; /* Space for the fixed header */
}

.hero-content {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    width: 90%;
    max-width: 1200px; /* Maximum width for the content area */
}

/* Left side text content */
.text-content {
    color: var(--text-light);
    max-width: 500px;
    padding-top: 50px;
}

.text-content h1 {
    font-size: 50px;
    font-weight: 700;
    line-height: 1.2;
    margin-bottom: 30px;
    text-transform: uppercase;
}

.btn-secondary {
    background: var(--primary-color);
    color: var(--background-dark);
    padding: 15px 40px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: opacity 0.3s;
}

.btn-secondary:hover {
    opacity: 0.9;
}


/* Right side booking form */
.booking-form-card {
    background: var(--form-bg);
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    width: 350px;
    position: relative; /* For the 'TAXI' watermark */
}

/* 'TAXI' watermark styling */
.booking-form-card::before {
    content: "TAXI";
    position: absolute;
    top: 5px;
    right: 15px;
    font-size: 50px;
    font-weight: 900;
    color: rgba(0, 0, 0, 0.1);
    transform: rotate(5deg);
    pointer-events: none;
}

.booking-form {
    display: flex;
    flex-direction: column;
}

.booking-form label {
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 5px;
    color: var(--text-dark);
}

.booking-form input[type="text"],
.booking-form input[type="date"],
.booking-form input[type="time"] {
    padding: 12px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 15px;
    width: 100%;
}

.form-submit-btn {
    margin-top: 15px;
    width: 100%;
    padding: 15px;
    text-transform: uppercase;
    font-weight: 700;
}


/* --- Placeholder for lower sections --- */
.features-placeholder {
    padding: 100px 5%;
    text-align: center;
    background-color: #f4f4f4;
}

/* --- Basic Responsiveness (Optional but recommended) --- */
@media (max-width: 992px) {
    .hero-content {
        flex-direction: column;
        align-items: center;
    }

    .text-content {
        text-align: center;
        margin-bottom: 40px;
        padding-top: 0;
    }

    .text-content h1 {
        font-size: 40px;
    }
}

@media (max-width: 600px) {
    .navbar {
        flex-direction: column;
        padding: 15px;
        background: var(--background-dark);
    }
    
    .nav-links {
        margin-top: 10px;
    }

    .nav-links a {
        margin: 0 8px;
    }

    .hero-section {
        height: auto;
        padding-bottom: 50px;
    }

    .booking-form-card {
        width: 90%;
    }
}
