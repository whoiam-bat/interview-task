/*
FILLING UP purchase TABLE WITH SAMPLE DATA
*/
INSERT INTO purchase (title, description, date_created) VALUES ('Daikon Radish', 'Integer tincidunt ante vel ipsum.', '2020-06-10');
INSERT INTO purchase (title, description, date_created) VALUES ('Ham - Cooked Bayonne Tinned', 'Sed accumsan felis.', '2004-10-05');
INSERT INTO purchase (title, description, date_created) VALUES ('Coconut - Whole', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2003-12-26');
INSERT INTO purchase (title, description, date_created) VALUES ('Campari', 'Donec ut dolor.', '2001-05-01');
INSERT INTO purchase (title, description, date_created) VALUES ('Juice - Pineapple, 341 Ml', 'Quisque ut erat.', '2022-07-06');
INSERT INTO purchase (title, description, date_created) VALUES ('Fennel - Seeds', 'Etiam faucibus cursus urna.', '2012-09-21');
INSERT INTO purchase (title, description, date_created) VALUES ('Tuna - Fresh', 'Nunc purus.', '2022-11-21');
INSERT INTO purchase (title, description, date_created) VALUES ('Pepper - Green, Chili', 'Mauris ullamcorper purus sit amet nulla.', '2010-08-19');
INSERT INTO purchase (title, description, date_created) VALUES ('Vinegar - White Wine', 'Etiam vel augue.', '2001-07-12');
INSERT INTO purchase (title, description, date_created) VALUES ('Salt - Seasoned', 'Quisque id justo sit amet sapien dignissim vestibulum.', '2020-05-15');
INSERT INTO purchase (title, description, date_created) VALUES ('Pastry - Chocolate Marble Tea', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '2014-07-27');
INSERT INTO purchase (title, description, date_created) VALUES ('Sugar - Sweet N Low, Individual', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2023-01-11');
INSERT INTO purchase (title, description, date_created) VALUES ('Bagel - Whole White Sesame', 'Nulla nisl.', '2022-06-07');
INSERT INTO purchase (title, description, date_created) VALUES ('Wheat - Soft Kernal Of Wheat', 'Morbi quis tortor id nulla ultrices aliquet.', '2019-10-06');
INSERT INTO purchase (title, description, date_created) VALUES ('Tobasco Sauce', 'Suspendisse potenti.', '2017-12-16');
INSERT INTO purchase (title, description, date_created) VALUES ('Juice - V8 Splash', 'Integer tincidunt ante vel ipsum.', '2012-03-12');
INSERT INTO purchase (title, description, date_created) VALUES ('Tea - Orange Pekoe', 'Integer tincidunt ante vel ipsum.', '2001-10-08');
INSERT INTO purchase (title, description, date_created) VALUES ('Buttons', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2015-01-17');
INSERT INTO purchase (title, description, date_created) VALUES ('Mussels - Frozen', 'Nulla tempus.', '2007-01-14');
INSERT INTO purchase (title, description, date_created) VALUES ('Onions - Cippolini', 'Duis consequat dui nec nisi volutpat eleifend.', '2012-05-14');

/*
FILLING UP customer TABLE WITH SAMPLE DATA
*/
INSERT INTO customer (username) VALUES ('mmortel0');
INSERT INTO customer (username) VALUES ('llief1');
INSERT INTO customer (username) VALUES ('aknappitt2');
INSERT INTO customer (username) VALUES ('nesby3');
INSERT INTO customer (username) VALUES ('gartist4');
INSERT INTO customer (username) VALUES ('tciementini5');
INSERT INTO customer (username) VALUES ('cbirrell6');
INSERT INTO customer (username) VALUES ('rridewood7');
INSERT INTO customer (username) VALUES ('oitzkovwich8');
INSERT INTO customer (username) VALUES ('tkenner9');

/*
FILLING UP sales JOIN TABLE WITH SAMPLE DATA
*/
INSERT INTO sales (customer_id, purchase_id) VALUES (1, 1);
INSERT INTO sales (customer_id, purchase_id) VALUES (1, 2);
INSERT INTO sales (customer_id, purchase_id) VALUES (1, 3);
INSERT INTO sales (customer_id, purchase_id) VALUES (1, 4);
INSERT INTO sales (customer_id, purchase_id) VALUES (2, 5);
INSERT INTO sales (customer_id, purchase_id) VALUES (2, 6);
INSERT INTO sales (customer_id, purchase_id) VALUES (2, 7);
INSERT INTO sales (customer_id, purchase_id) VALUES (2, 8);
INSERT INTO sales (customer_id, purchase_id) VALUES (3, 9);
INSERT INTO sales (customer_id, purchase_id) VALUES (3, 10);
INSERT INTO sales (customer_id, purchase_id) VALUES (3, 11);
INSERT INTO sales (customer_id, purchase_id) VALUES (3, 12);
INSERT INTO sales (customer_id, purchase_id) VALUES (4, 13);
INSERT INTO sales (customer_id, purchase_id) VALUES (4, 14);
INSERT INTO sales (customer_id, purchase_id) VALUES (4, 15);
INSERT INTO sales (customer_id, purchase_id) VALUES (4, 16);
INSERT INTO sales (customer_id, purchase_id) VALUES (5, 17);
INSERT INTO sales (customer_id, purchase_id) VALUES (5, 18);
INSERT INTO sales (customer_id, purchase_id) VALUES (5, 19);
INSERT INTO sales (customer_id, purchase_id) VALUES (5, 20);
INSERT INTO sales (customer_id, purchase_id) VALUES (6, 1);
INSERT INTO sales (customer_id, purchase_id) VALUES (6, 5);
INSERT INTO sales (customer_id, purchase_id) VALUES (6, 3);
INSERT INTO sales (customer_id, purchase_id) VALUES (7, 2);
INSERT INTO sales (customer_id, purchase_id) VALUES (7, 4);
INSERT INTO sales (customer_id, purchase_id) VALUES (7, 17);
INSERT INTO sales (customer_id, purchase_id) VALUES (7, 10);
INSERT INTO sales (customer_id, purchase_id) VALUES (8, 19);
INSERT INTO sales (customer_id, purchase_id) VALUES (8, 8);
INSERT INTO sales (customer_id, purchase_id) VALUES (9, 11);
INSERT INTO sales (customer_id, purchase_id) VALUES (9, 15);
INSERT INTO sales (customer_id, purchase_id) VALUES (10, 20);






