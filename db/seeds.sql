USE wishlist_db;

INSERT INTO wishlist (user_id, item_name, item_category, picture_url, item_url, price)
VALUES (1, "Cannon Camera", "Technology", "www.amazon.com/cannon", "www.amazon.com", 599.99),
 (1, "Fishing Pole", "Sports", "www.amazon.com/fishing", "www.amazon.com", 99.99),
 (1, "Cologne", "Other", "www.amazon.com/cologe", "www.amazon.com", 59.99),
 (1, "Kayak", "Outdoors", "www.amazon.com/kayaks", "www.amazon.com", 899.99),
 (1, "Motiv Ring", "Technology", "www.amazon.com/fitnesstrackers", "www.amazon.com", 199.99),
 (1, "Thule Storage Box", "Sports", "www.amazon.com/car/accesories", "www.amazon.com", 299.99),
 (1, "Sun Glasses", "Other", "www.amazon.com/glasses", "www.amazon.com", 199.99),
 (2, "Cannon Camera", "Technology", "www.amazon.com/cannon", "www.amazon.com", 599.99),
 (2, "Fishing Pole", "Sports", "www.amazon.com/fishing", "www.amazon.com", 99.99),
 (2, "Cologne", "Other", "www.amazon.com/cologe", "www.amazon.com", 59.99),
 (2, "Kayak", "Outdoors", "www.amazon.com/kayaks", "www.amazon.com", 899.99),
 (2, "Motiv Ring", "Technology", "www.amazon.com/fitnesstrackers", "www.amazon.com", 299.99),
 (2, "Thule Storage Box", "Sports", "www.amazon.com/car/accesories", "www.amazon.com", 299.99),
 (2, "Sun Glasses", "Other", "www.amazon.com/glasses", "www.amazon.com", 199.99),
 (3, "Cannon Camera", "Technology", "www.amazon.com/cannon", "www.amazon.com", 599.99),
 (3, "Fishing Pole", "Sports", "www.amazon.com/fishing", "www.amazon.com", 99.99),
 (3, "Cologne", "Other", "www.amazon.com/cologe", "www.amazon.com", 59.99),
 (3, "Kayak", "Outdoors", "www.amazon.com/kayaks", "www.amazon.com", 899.99),
 (3, "Motiv Ring", "Technology", "www.amazon.com/fitnesstrackers", "www.amazon.com", 299.99),
 (3, "Thule Storage Box", "Sports", "www.amazon.com/car/accesories", "www.amazon.com", 299.99),
 (3, "Sun Glasses", "Other", "www.amazon.com/glasses", "www.amazon.com", 199.99);



INSERT INTO users (name, email, birthday, location) 
VALUES ("Gleb Ganin", "gleb@trilogy.edu", 08/26, "Burlingame,CA"),
 ("Esteban", "esteband@trilogy.edu", 09/26, "San Leandro,CA"),
 ("Stephanie", "stephanie@trilogy.edu", 02/26, "San Francisco,CA"),
 ("Alisa Keenan", "alisa@trilogy.edu", 01/27, "Burlingame ,CA"),
 ("James Warren", "james@trilogy.edu", 01/27, "West Hollywood ,CA"),
 ("Daniel Kolb", "daniel@trilogy.edu", 01/27, "San Mateo ,CA");



INSERT INTO categories (name)
VALUES ("Technology");

INSERT INTO categories (name)
VALUES ("Clothes");

INSERT INTO categories (name)
VALUES ("Sports");

INSERT INTO categories (name)
VALUES ("Home Improvement");

INSERT INTO categories (name)
VALUES ("Other");