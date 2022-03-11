CREATE TABLE `productlines` (
  `productLine` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `textDescription` varchar(255) DEFAULT NULL,
  `htmlDescription` varchar(255) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  CONSTRAINT `PK_productlines` PRIMARY KEY (`productLine`),
) ENGINE=InnoDB;

CREATE TABLE `products` (
  `productCode` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `productName` varchar(25) NOT NULL,
  `productLine` int(11) UNSIGNED NOT NULL,
  `productSale` varchar(25) DEFAULT NULL,
  `productVendor` varchar(25) DEFAULT NULL,
  `productDescription` varchar(50) DEFAULT NULL,
  `quantityInStock` int(11) DEFAULT NULL,
  `buyPrice` int(11) DEFAULT NULL,
  `MSRP` int(11) DEFAULT NULL,
  CONSTRAINT `PK_products` PRIMARY KEY (`productCode`),
  CONSTRAINT FK_productlines_products FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`), 
) ENGINE=InnoDB;

CREATE TABLE `orderdetails` (
  `orderNumber` int(11) UNSIGNED NOT NULL,
  `productCode` int(11) NOT NULL,
  `quantityOrdered` int(11) DEFAULT NULL,
  `priceEach` int(11) DEFAULT NULL,
  `orderLineNumber` int(11) DEFAULT NULL,
  CONSTRAINT FK_orders_orderdetails FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`),
  CONSTRAINT FK_products_orderdetails FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`), 
) ENGINE=InnoDB;

CREATE TABLE `orders` (
  `orderNumber` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `requiredDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shippedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `customerNumber` int(11) NOT NULL,
  CONSTRAINT `PK_order` PRIMARY KEY (`orderNumber`),
  CONSTRAINT FK_customers_orders FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`), 
) ENGINE=InnoDB;

CREATE TABLE `customers` (
  `customerNumber` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, 
  `customerName` varchar(60) NOT NULL UNIQUE,
  `contactLastName` varchar(30) NOT NULL,
  `contactFirstName` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL, 
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL, 
  `postalCode` varchar(6) DEFAULT NULL, 
  `country` varchar(30) DEFAULT NULL, 
  `salesRepEmployeeNumber` varchar(10) DEFAULT NULL,
  `creditLimit` int(11) DEFAULT NULL, 
  CONSTRAINT `PK_customers` PRIMARY KEY (`customerNumber`),
  CONSTRAINT `CHK_customers_phone` CHECK(`phone` is null or `phone` regexp '^[0-9]{10}$'),
  CONSTRAINT `CHK_customers_salesRepEmployeeNumber` CHECK(`salesRepEmployeeNumber` is null or `salesRepEmployeeNumber` regexp '^[0-9]{10}$'),
) ENGINE=InnoDB;

CREATE TABLE `payments` (
  `checkNumber` varchar(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customerNumber` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `paymentDate` datetime DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `PK_order` PRIMARY KEY (`checkNumber`),
  CONSTRAINT FK_customers_payments FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`), 
) ENGINE=InnoDB;








