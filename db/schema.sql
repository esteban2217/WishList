CREATE DATABASE  wishlist_db;

USE wishlist_db;

CREATE TABLE users(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
    birthday VARCHAR (255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE items(
	id INT NOT NULL AUTO_INCREMENT,
	item_name VARCHAR(255) NOT NULL,
	wishlist_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (wishlist_id) REFERENCES users (id)
);

CREATE TABLE wishlist(
	wishlist_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL, 
    item_name VARCHAR(255) NOT NULL,
	item_category VARCHAR(255) NOT NULL,
	picture_url VARCHAR(255) NULL,
    item_url VARCHAR (255) NULL,
    price DECIMAL (10,2),
	PRIMARY KEY (wishlist_id)
);

CREATE TABLE categories(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE wishlist_categories(
	wishlist_id INT NOT NULL,
	category_id INT NOT NULL,
    FOREIGN KEY (wishlist_id) REFERENCES users(id),
	FOREIGN KEY (category_id) REFERENCES users(id)
);