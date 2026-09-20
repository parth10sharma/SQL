create database retails;

use retail;

-- Create category Table
CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

-- Create product Table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    brand VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Create customer Table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT,
    city VARCHAR(100),
    wallet_balance DECIMAL(10, 2) DEFAULT 0.00
);

-- Create order Table
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Create order_item Table
CREATE TABLE order_item (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create discount Table
CREATE TABLE discount (
    discount_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create supplier Table
CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    phone_number VARCHAR(15),
    city VARCHAR(100)
);

-- Create product_supplier Table
CREATE TABLE product_supplier (
    product_id INT,
    supplier_id INT,
    stock_quantity INT, 
    supply_price DECIMAL(10,2),
    supply_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (product_id, supplier_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);


-- Create rating Table
CREATE TABLE rating (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create Table for Logging Price Changes --
CREATE TABLE price_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    old_price DECIMAL(10,2) NOT NULL,
    new_price DECIMAL(10,2) NOT NULL,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(product_id) 
);

-- Insert records into category
INSERT INTO category (category_name) VALUES
('Electronics'), ('Fashion'), ('Home Appliances'), ('Groceries'), ('Books'),
('Sports'), ('Beauty & Personal Care'), ('Toys'), ('Automobiles'), ('Stationery'),
('Healthcare'), ('Furniture'), ('Footwear'), ('Jewelry'), ('Music Instruments'),
('Gardening'), ('Pet Supplies'), ('Gaming'), ('Mobile Accessories'), ('Kitchenware');

-- Insert records into product
INSERT INTO product (product_name, price, stock_quantity, category_id, brand) VALUES
('Samsung Galaxy S21', 69999.00, 50, 1, 'Samsung'),
('Sony Headphones', 2999.00, 100, 1, 'Sony'),
('T-shirt (Cotton)', 499.00, 200, 2, 'Puma'),
('Mixer Grinder', 3499.00, 30, 3, 'Bajaj'),
('Basmati Rice (5kg)', 649.00, 150, 4, 'Daawat'),
('Cricket Bat', 3499.00, 25, 6, 'SS'),
('Face Wash', 199.00, 120, 7, 'Himalaya'),
('Remote Car Toy', 899.00, 80, 8, 'Funskool'),
('Bike Helmet', 1499.00,100, 9, 'Steelbird'),
('Notebook (200 pages)', 49.00, 300, 10, 'Classmate'),
('Pain Reliever Gel', 299.00, 100, 11, 'Volini'),
('Wooden Table', 7999.00, 15, 12, 'Godrej'),
('Running Shoes', 1999.00, 50, 13, 'Nike'),
('Gold Necklace', 59999.00, 5, 14, 'Tanishq'),
('Acoustic Guitar', 8999.00, 20, 15, 'Yamaha'),
('Flower Pot', 499.00, 40, 16, 'Gardenia'),
('Dog Food (10kg)', 2499.00, 20, 17, 'Pedigree'),
('Gaming Mouse', 1499.00, 60, 18, 'Logitech'),
('Phone Cover', 499.00, 100, 19, 'Spigen'),
('Cookware Set', 3499.00, 30, 20, 'Prestige'),
('Samsung Galaxy A14', 13999.00, 80, 1, 'Samsung'),
('Sony Bluetooth Speaker', 4999.00, 70, 1, 'Sony'),
('Polo Shirt', 899.00, 150, 2, 'Adidas'),
('Juicer', 5499.00, 20, 3, 'Philips'),
('Brown Rice (5kg)', 749.00, 90, 4, 'India Gate'),
('Hockey Stick', 2499.00, 30, 6, 'Kookaburra'),
('Shampoo (500ml)', 349.00, 90, 7, 'Dove'),
('Building Blocks Toy', 1299.00, 60, 8, 'Lego'),
('Riding Gloves', 999.00, 50, 9, 'Royal Enfield'),
('Drawing Book', 99.00, 200, 10, 'Camlin'),
('Basketball Shoes', 2499.00, 40, 13, 'Reebok'),
('Diamond Ring', 89999.00, 3, 14, 'Kalyan Jewellers'),
('Electric Keyboard', 14999.00, 10, 15, 'Casio'),
('Garden Shovel', 599.00, 30, 16, 'Fiskars'),
('Cat Food (5kg)', 1499.00, 50, 17, 'Whiskas'),
('Mechanical Keyboard', 2999.00, 40, 18, 'Razer'),
('Screen Protector', 299.00, 120, 19, 'OtterBox'),
('Non-Stick Frying Pan', 1499.00, 50, 20, 'Wonderchef');

-- Insert records into customer
INSERT INTO customer (customer_name, email, phone_number, address, city, wallet_balance) VALUES
('Aarav Sharma', 'aarav.sharma@example.com', '9876543210', 'Sector 15, Noida', 'Noida', 1500.00),
('Ananya Singh', 'ananya.singh@example.com', '9876543211', 'DLF Phase 1, Gurgaon', 'Gurgaon', 2000.00),
('Vivaan Gupta', 'vivaan.gupta@example.com', '9876543212', 'MG Road, Bangalore', 'Bangalore', 2500.00),
('Diya Agarwal', 'diya.agarwal@example.com', '9876543213', 'Salt Lake, Kolkata', 'Kolkata', 1800.00),
('Arjun Mehta', 'arjun.mehta@example.com', '9876543214', 'Bandra, Mumbai', 'Mumbai', 2200.00),
('Aanya Choudhary', 'aanya.choudhary@example.com', '9876543215', 'Kukatpally, Hyderabad', 'Hyderabad', 1700.00),
('Kabir Iyer', 'kabir.iyer@example.com', '9876543216', 'Raja Garden, Delhi', 'Delhi', 1300.00),
('Ishaan Nair', 'ishaan.nair@example.com', '9876543217', 'Thane West, Mumbai', 'Mumbai', 1900.00),
('Myra Kapoor', 'myra.kapoor@example.com', '9876543218', 'South Bopal, Ahmedabad', 'Ahmedabad', 2100.00),
('Aditi Verma', 'aditi.verma@example.com', '9876543219', 'Rajarhat, Kolkata', 'Kolkata', 2000.00),
('Advait Kulkarni', 'advait.kulkarni@example.com', '9876543220', 'Baner, Pune', 'Pune', 3000.00),
('Kiara Bajaj', 'kiara.bajaj@example.com', '9876543221', 'Banjara Hills, Hyderabad', 'Hyderabad', 1700.00),
('Krishna Mishra', 'krishna.mishra@example.com', '9876543222', 'Indiranagar, Bangalore', 'Bangalore', 1200.00),
('Saanvi Jain', 'saanvi.jain@example.com', '9876543223', 'Ashok Nagar, Chennai', 'Chennai', 2500.00),
('Atharv Bhatia', 'atharv.bhatia@example.com', '9876543224', 'Vashi, Navi Mumbai', 'Mumbai', 1400.00),
('Tanya Joshi', 'tanya.joshi@example.com', '9876543225', 'Madhapur, Hyderabad', 'Hyderabad', 2600.00),
('Aryan Rao', 'aryan.rao@example.com', '9876543226', 'Anna Nagar, Chennai', 'Chennai', 2300.00),
('Zara Malhotra', 'zara.malhotra@example.com', '9876543227', 'Gandhipuram, Coimbatore', 'Coimbatore', 2100.00),
('Reyansh Patel', 'reyansh.patel@example.com', '9876543228', 'Civil Lines, Jaipur', 'Jaipur', 2000.00),
('Avni Saxena', 'avni.saxena@example.com', '9876543229', 'Shivajinagar, Pune', 'Pune', 2700.00),
('Alice Johnson', 'alice.johnson@example.com', '9876543210', '123 Greenway Blvd', 'Delhi', 1500.00),
('Bob Smith', 'bob.smith@example.com', '8765432109', '456 Elm Street', 'Mumbai', 2000.50),
('Cathy Brown', 'cathy.brown@example.com', '7654321098', '789 Oak Avenue', 'Kolkata', 1200.00),
('David White', 'david.white@example.com', '6543210987', '101 Pine Lane', 'Chennai', 1750.25),
('Emma Davis', 'emma.davis@example.com', '5432109876', '202 Maple Court', 'Hyderabad', 2200.75),
('Kalyan Kumar','kalyan.kumar@example.com','9890987890','10 Gandhi Road','Bangalore',3000.00),
('Rohit Sharma', 'rohit.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 5000.00),
('Ananya Gupta', 'ananya.gupta@example.com', '9876543211', '45 JP Nagar', 'Bangalore', 2500.00),
('Priya Singh', 'priya.singh@example.com', '9876543212', '78 Connaught Place', 'Delhi', 10000.00),
('Vikram Chawla', 'vikram.chawla@example.com', '9876543213', '67 Park Street', 'Kolkata', 12000.00),
('Sneha Patel', 'sneha.patel@example.com', '9876543214', '56 Satellite Road', 'Ahmedabad', 8000.00);

INSERT INTO `order` (customer_id, order_date, total_amount) VALUES
(1, '2024-12-01 10:30:00', 5999.00),
(2, '2024-12-02 14:15:00', 3499.00),
(1, '2024-12-03 16:00:00', 1999.00),
(4, '2024-11-04 11:45:00', 8499.00),
(4, '2024-10-05 09:30:00', 499.00),
(6, '2024-12-06 18:10:00', 69999.00),
(6, '2024-10-07 12:30:00', 2999.00),
(8, '2024-12-08 20:00:00', 499.00),
(9, '2024-11-09 15:20:00', 3499.00),
(10, '2024-12-10 08:10:00', 649.00),
(10, '2024-10-11 14:50:00', 2499.00),
(12, '2024-9-12 19:30:00', 1499.00),
(10, '2024-9-13 10:00:00', 3499.00),
(12, '2024-8-14 16:45:00', 199.00),
(15, '2024-8-15 09:00:00', 8999.00),
(16, '2024-11-16 17:30:00', 299.00),
(18, '2024-10-17 11:10:00', 7999.00),
(18, '2024-8-18 13:25:00', 2499.00),
(18, '2024-11-19 08:45:00', 1499.00),
(20, '2024-9-20 12:20:00', 59999.00),
(1, '2024-05-15 10:30:00', 69999.00),  
(2, '2024-08-20 14:00:00', 6498.00),   
(3, '2024-05-25 15:45:00', 13998.00),  
(4, '2024-05-10 12:00:00', 10999.00),  
(5, '2024-05-15 17:30:00', 17497.00),  
(6, '2024-06-05 11:45:00', 999.00),    
(7, '2024-06-15 13:00:00', 3499.00),   
(8, '2024-07-18 14:30:00', 2999.00),   
(9, '2024-07-10 09:30:00', 3998.00),   
(10, '2024-10-21 16:45:00', 7999.00);

INSERT INTO order_item (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 69999.00),
(2, 4, 1, 3499.00),
(3, 13, 1, 1999.00),
(4, 15, 1, 8999.00),
(5, 10, 10, 49.00),
(6, 1, 1, 69999.00),
(7, 2, 1, 2999.00),
(8, 19, 2, 499),
(9, 3, 1, 499.00),
(10, 5, 1, 649.00),
(11, 17, 1, 2499.00),
(12, 9, 1, 1499.00),
(13, 20, 1, 3499.00),
(14, 7, 1, 199.00),
(15, 15, 1, 8999.00),
(16, 11, 1, 299.00),
(17, 12, 1, 7999.00),
(18, 17, 1, 2499.00),
(19, 18, 1, 1499.00),
(20, 14, 1, 59999.00),
(2, 5, 5, 649.00),   
(2, 19, 4, 499.00),  
(3, 21, 2, 13999.00), 
(4, 31, 1, 2499.00), 
(4, 36, 10, 2999.00),
(5, 14, 1, 59999.00),
(6, 29, 1, 999.00), 
(7, 24, 1, 5499.00), 
(8, 6, 1, 3499.00), 
(9, 7, 20, 199.00), 
(10, 12, 1, 7999.00); 

INSERT INTO discount (product_id, discount_percentage, start_date, end_date) VALUES
(1, 10.00, '2024-12-01', '2024-12-31'),
(2, 15.00, '2024-12-01', '2024-12-15'),
(5, 25.00, '2024-12-10', '2024-12-30'),
(6, 10.00, '2024-12-01', '2024-12-31'),
(7, 15.00, '2024-12-01', '2024-12-15'),
(8, 5.00, '2024-12-01', '2024-12-20'),
(10, 25.00, '2024-12-10', '2024-12-30'),
(11, 10.00, '2024-12-01', '2024-12-31'),
(12, 15.00, '2024-12-01', '2024-12-15'),
(15, 25.00, '2024-12-10', '2024-12-30'),
(16, 10.00, '2024-12-01', '2024-12-31'),
(17, 15.00, '2024-12-01', '2024-12-15'),
(18, 5.00, '2024-12-01', '2024-12-20'),
(20, 25.00, '2024-12-10', '2024-12-30');

INSERT INTO supplier (supplier_name, contact_person, phone_number, city) VALUES
('Raj Electronics', 'Raj Malhotra', '9876543300', 'Mumbai'),
('Varun Fashion', 'Varun Kapoor', '9876543301', 'Delhi'),
('Home Essentials Co.', 'Amit Agarwal', '9876543302', 'Bangalore'),
('Grocery Hub', 'Sita Sharma', '9876543303', 'Hyderabad'),
('Sports World', 'Rahul Jain', '9876543304', 'Pune'),
('Beauty Bliss', 'Priya Gupta', '9876543305', 'Chennai'),
('Fun Toys', 'Arjun Reddy', '9876543306', 'Kolkata'),
('Safe Ride Helmets', 'Kabir Nair', '9876543307', 'Ahmedabad'),
('Notebook World', 'Diya Mehta', '9876543308', 'Coimbatore'),
('Kitchen King', 'Reema Shah', '9876543309', 'Jaipur');

INSERT INTO product_supplier (product_id, supplier_id, stock_quantity, supply_price, supply_date, status) VALUES
(1, 1, 25, 41999.00, '2024-11-05', 'Delivered'),
(2, 1, 40, 1799.00, '2024-11-10', 'Delivered'),
(3, 2, 50, 299.00, '2024-11-15', 'Delivered'),
(4, 3, 15, 2299.00, '2025-02-04', 'In Progress'),
(5, 4, 40, 399.00, '2024-11-20', 'Delivered'),
(6, 5, 10, 2099.00, '2024-11-25', 'Delivered'),
(7, 6, 30, 129.00, '2024-12-01', 'Delivered'),
(8, 7, 20, 499.00, '2024-12-05', 'Pending'),
(9, 8, 50, 999.00, '2024-12-10', 'Delivered'),
(10, 9, 100, 29.00, '2024-12-15', 'Delivered'),
(11, 10, 40, 179.00, '2024-12-18', 'Delivered'),
(12, 3, 5, 4799.00, '2024-11-22', 'Cancelled'),
(13, 2, 25, 1399.00, '2024-12-20', 'Delivered'),
(14, 6, 3, 35999.00, '2024-11-28', 'Delivered'),
(15, 5, 10, 5399.00, '2024-12-25', 'Pending'),
(16, 4, 20, 299.00, '2024-12-30', 'Delivered'),
(17, 7, 10, 1699.00, '2025-02-10', 'In Progress'),
(18, 8, 30, 899.00, '2024-11-08', 'Delivered'),
(19, 9, 50, 299.00, '2024-12-12', 'Delivered'),
(20, 10, 15, 2499.00, '2024-11-18', 'Cancelled');


INSERT INTO rating (customer_id, product_id, rating, review) VALUES
(1, 1, 5, 'Amazing product! Highly recommend.'),
(2, 2, 4, 'Good value for money.'),
(2, 3, 3, 'Average quality.'),
(4, 4, 5, null),
(5, 5, 4, null),
(5, 6, 5, 'Worth every penny.'),
(7, 7, 4, 'Good product, but delivery was late.'),
(8, 8, 3, null),
(8, 8, 4, null),
(9, 9, 5, 'Superb build and design.'),
(10, 10, 4, 'Good quality at a decent price.'),
(11, 11, 5, 'Works as expected.'),
(12, 12, 4, 'Satisfied with the purchase.'),
(13, 13, 5, 'Very comfortable and stylish.'),
(14, 14, 4, null ),
(14, 15, 5, 'Amazing sound quality.'),
(16, 16, 4, 'Great for gardening enthusiasts.'),
(17, 17, 5, 'My dog loves it!'),
(17, 18, 4, 'Perfect for gaming.'),
(17, 19, 3, 'Fits well, but a bit pricey.'),
(20, 20, 5, 'Very durable and convenient.'),
(1, 1, 5, 'Excellent phone with great features!'),        -- Samsung Galaxy S21
(2, 19, 4, null),    -- Phone Cover
(3, 21, 5, null),-- Samsung Galaxy A14
(4, 31, 4, 'Comfortable shoes for basketball players.'),   -- Basketball Shoes
(5, 14, 5, null),          -- Gold Necklace
(6, 29, 3, 'Good gloves, but not very durable.'),          -- Riding Gloves
(7, 24, 5, 'High-quality juicer with great performance.'), -- Juicer
(8, 6, 4, null),             -- Cricket Bat
(9, 7, 4, 'Face wash is good for everyday use.'),          -- Face Wash
(10, 12, 5, 'Sturdy and elegant wooden table.');       
