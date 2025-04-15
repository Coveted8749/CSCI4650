-- Inserting data into address table
INSERT INTO address (street_address, city, state, zip, latitude, longitude) VALUES
('3500 Wookiee Rd', 'Endor', 'CA', '94304', 37.7749, -122.4194),
('1200 Yoda Blvd', 'Dagobah', 'LA', '92001', 34.0522, -118.2437),
('5000 Bantha Ave', 'Tatooine', 'AZ', '85250', 36.1699, -115.1398),
('100 Jedi Way', 'Coruscant', 'DC', '20001', 38.9072, -77.0369);
-- Inserting data into store table
INSERT INTO store (store_id, store_name, street_address, zip) VALUES
(1, 'The Wookiee Grill', '3500 Wookiee Rd', 94304),
(2, 'Dagobah Pizzeria', '1200 Yoda Blvd', 92001),
(3, 'Tatooine Taco & Burrito', '5000 Bantha Ave', 85250),
(4, 'The Jedi Noodle', '100 Jedi Way', 20001);
-- Inserting data into menu_item table
INSERT INTO menu_item (item_id, description, price, start_date, end_date, store_id) VALUES
(1, 'Chewie’s Double Stack', 12.99, '2025-01-01', NULL, 1),
(2, 'Endor Veggie Burger', 10.99, '2025-01-01', NULL, 1),
(3, 'Tatooine Sunrise Burger', 11.99, '2025-01-01', NULL, 1),
(4, 'The Mandalorian', 14.99, '2025-01-01', NULL, 1),
(5, 'Sarlacc Fries', 4.99, '2025-01-01', NULL, 1),
(6, 'Womp Rat Nuggets', 7.99, '2025-01-01', NULL, 1),
(7, 'Yoda’s Special', 13.99, '2025-01-01', NULL, 2),
(8, 'Vader’s Revenge', 14.99, '2025-01-01', NULL, 2),
(9, 'The Force', 11.99, '2025-01-01', NULL, 2),
(10, 'Rebel Veggie Supreme', 12.99, '2025-01-01', NULL, 2),
(11, 'Death Star Supreme', 16.99, '2025-01-01', NULL, 2),
(12, 'Bespin BBQ Chicken', 15.99, '2025-01-01', NULL, 2),
(13, 'The Sandcrawler', 8.99, '2025-01-01', NULL, 3),
(14, 'Jabba’s Deluxe', 9.99, '2025-01-01', NULL, 3),
(15, 'Bantha Steak Burrito', 12.99, '2025-01-01', NULL, 3),
(16, 'Droid Special', 8.49, '2025-01-01', NULL, 3),
(17, 'Boba\'s Favorite', 10.99, '2025-01-01', NULL, 3),
(18, 'The Podracer', 7.99, '2025-01-01', NULL, 3),
(19, 'Luke’s Ramen', 11.99, '2025-01-01', NULL, 4),
(20, 'The Dark Side', 13.99, '2025-01-01', NULL, 4),
(21, 'Obi-Wan’s Delight', 12.99, '2025-01-01', NULL, 4),
(22, 'Princess Leia’s Veggie Delight', 10.99, '2025-01-01', NULL, 4),
(23, 'Yoda’s Wisdom', 14.99, '2025-01-01', NULL, 4),
(24, 'The Skywalker', 15.99, '2025-01-01', NULL, 4);
-- Inserting data into user table
INSERT INTO user (user_id, password, first_name, last_name, username, number_of_reviews) VALUES
(1, 'password123', 'Luke', 'Skywalker', 'LukeSkywalker87', 7),
(2, 'password456', 'Darth', 'Vader', 'DarthVader555', 7),
(3, 'password789', 'Leia', 'Organa', 'PrincessLeia23', 7),
(4, 'password321', 'Han', 'Solo', 'HanSolo75', 7),
(5, 'password654', 'Obi-Wan', 'Kenobi', 'ObiWanKenobi42', 7),
(6, 'password987', 'R2-D2', '', 'R2D2User', 7);

-- Inserting data into review table
INSERT INTO review (store_id, user_id, review_timestamp, number_of_stars, review_text) VALUES
(1, 1, '2025-03-01 12:30:00', 5, 'This burger was as strong as the Force itself. The Mandalorian burger with the fried egg was *out of this galaxy*. The fries? Sarlacc-level crispy.'),
(2, 1, '2025-03-02 15:00:00', 4, 'Vader’s Revenge pizza has the right kick, just like my lightsaber. A bit too spicy, though. But I guess I’m just not used to the Dark Side.'),
(3, 1, '2025-03-03 14:15:00', 3, 'The Sandcrawler was decent, but I’d prefer the Bantha Steak burrito next time. The guac was good, but it needed more spice.'),
(4, 1, '2025-03-04 10:00:00', 5, 'The Skywalker ramen was *amazing*! Perfectly balanced—like the Force itself. The crispy garlic was a great touch.'),
(1, 2, '2025-03-05 17:45:00', 3, 'The burger was good, but it didn’t quite capture the dark power I expected. Maybe the Mandalorian burger was too light for me.'),
(2, 2, '2025-03-06 19:20:00', 5, 'Yoda’s Special pizza was perfect. So much flavor, it was like using the Force to deliver the best pizza. Very impressed.'),
(3, 2, '2025-03-07 18:10:00', 4, 'Jabba’s Deluxe was tasty, but not spicy enough. I wanted more of a challenge, like fighting Obi-Wan.'),
(4, 2, '2025-03-08 09:30:00', 2, 'The Dark Side ramen was too spicy, even for me. I was choking on my own rage. But the broth had potential.'),
(1, 3, '2025-03-09 12:25:00', 4, 'The Womp Rat Nuggets were delicious, just the right amount of crunch. The Wookiee’s burger was huge—almost like a challenge for me, but I did it!'),
(2, 3, '2025-03-10 13:30:00', 3, 'The Rebel Veggie Supreme was okay, but I expected more from a place named after Yoda. I’ll stick to my Rebel Alliance snacks.'),
(3, 3, '2025-03-11 14:00:00', 5, 'The Bantha Steak burrito was a masterpiece. It made me feel like I could conquer the galaxy, one bite at a time.'),
(4, 3, '2025-03-12 11:20:00', 5, 'Obi-Wan’s Delight was the best ramen I’ve had in ages. I almost felt the Force guiding me with every slurp.'),
(1, 4, '2025-03-13 17:35:00', 5, 'Chewie’s Double Stack was out of this world. It felt like I was mastering the Force with each bite.'),
(2, 4, '2025-03-14 18:10:00', 5, 'Yoda’s Special pizza was simple, but perfect. It’s like Yoda himself made it. This is the pizza you seek.'),
(3, 4, '2025-03-15 14:25:00', 5, 'The Sandcrawler burrito is what the galaxy needs. The rice and beans were well-seasoned, and the guac was a nice touch.'),
(4, 4, '2025-03-16 13:40:00', 5, 'Yoda’s Wisdom ramen was exactly what I needed. Balanced, like the Force itself. I could live off this.'),
(1, 5, '2025-03-17 19:10:00', 5, 'The Mandalorian burger made me feel like I was back in the cockpit of the Millennium Falcon. Definitely recommend!'),
(2, 5, '2025-03-18 20:05:00', 3, 'Death Star Supreme had too much cheese. You could say it was overkill. But it was still pretty good.'),
(3, 5, '2025-03-19 17:25:00', 4, 'Boba\'s Favorite had a lot of flavor, but the shrimp was a little undercooked. I’ll give it another shot though.'),
(4, 5, '2025-03-20 18:00:00', 4, 'Luke’s ramen was decent, but it didn’t quite hit the mark for me. Still, the broth was solid, and the pork');