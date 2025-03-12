# Online Book Shop System

## Overview
The Online Book Shop System is a web-based platform that allows users to browse, search, and purchase books online. It is developed using Java Server Pages (JSP) with a MySQL database to manage book information and user transactions.

## Features
- Display available books by category
- Add books to the cart
- User authentication (Login/Logout)
- Contact and About pages
- Responsive design using Bootstrap

## Technologies Used
- **Frontend**: HTML, CSS, Bootstrap, JavaScript
- **Backend**: JSP, Servlets
- **Database**: MySQL
- **Libraries**: jQuery, Feather Icons, FontAwesome

## Installation
### Prerequisites
Ensure you have the following installed:
- Java Development Kit (JDK)
- Apache Tomcat
- MySQL Database

### Steps to Set Up
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/online-book-shop.git
   ```
2. Configure the database:
   - Create a MySQL database and import the provided `bookshop.sql` file.
   - Update the `DBConnection` class with your database credentials.
3. Deploy the application:
   - Place the project folder inside `webapps` of your Apache Tomcat.
   - Start Tomcat and access the app via `http://localhost:8080/OnlineBookShop`.

## Database Schema
The system uses a `booklist` table with the following columns:
- `id` (Primary Key, INT, Auto Increment)
- `name` (VARCHAR)
- `author` (VARCHAR)
- `category` (VARCHAR)
- `price` (DECIMAL)
- `quantity` (INT)

## Usage
1. Open the application in a browser.
2. Browse books by category.
3. Add books to the cart.
4. Proceed to checkout.
5. Login or register to complete the purchase.


## License
This project is open-source under the MIT License.

## Contact
For inquiries, please contact [hmuesett2002@gmail.com].
