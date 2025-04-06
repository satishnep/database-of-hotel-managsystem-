CREATE DATABASE hotel;
USE hotel;
# This is guest table
CREATE TABLE Guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(255),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    nationality VARCHAR(100),
    passport_number VARCHAR(100)
);

SELECT *FROM Guests;

# about rooms details

CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type ENUM('Single', 'Double', 'Suite', 'Penthouse') NOT NULL,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_status ENUM('Available', 'Occupied', 'Maintenance', 'Booked') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    max_occupancy INT NOT NULL,
    floor INT NOT NULL
);

SELECT *FROM Rooms;

# this is a booking 

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    booking_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status ENUM('Confirmed', 'Cancelled', 'Completed', 'No Show') NOT NULL,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

SELECT *FROM Bookings;

# this about payment

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Cash', 'Credit Card', 'Debit Card', 'Online Transfer') NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

SELECT *FROM Payments;

# this is about employees

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    department ENUM('Reception', 'Housekeeping', 'Restaurant', 'Management', 'Security') NOT NULL,
    contact_number VARCHAR(15)
);

SELECT *FROM Employees;


# this about room_services

CREATE TABLE Room_Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    service_type ENUM('Laundry', 'Room Service', 'Spa', 'Housekeeping', 'Concierge') NOT NULL,
    description VARCHAR(255),
    service_date DATE NOT NULL,
    service_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
 
 SELECT *FROM Room_Services;
#about inventory 
 
 CREATE TABLE Inventory (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2),
    supplier VARCHAR(255),
    purchase_date DATE
);
 
 SELECT *FROM Inventory;
 
 
 # about feedack
 
 CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    booking_id INT NOT NULL,
    feedback_date DATE NOT NULL,
    rating INT CHECK(rating >= 1 AND rating <= 5),
    comments TEXT,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
SELECT *FROM Feedback;



# insert all the data into the tables 


