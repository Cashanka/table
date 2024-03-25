create database masterfly22;
use masterfly22;

CREATE TABLE movies (
  movie_id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  director VARCHAR(255),
  genre VARCHAR(255),
  release_year INT
);

CREATE TABLE subscribers (
  subscriber_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  subscription_plan VARCHAR(255),
  subscription_date DATE
);

CREATE TABLE rentals (
  rental_id INT PRIMARY KEY,
  movie_id INT,
  subscriber_id INT,
  rental_date DATE,
  return_date DATE,
  FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
  FOREIGN KEY (subscriber_id) REFERENCES subscribers (subscriber_id)
);



INSERT INTO movies VALUES
  (1, 'Fast and Furious', 'john', 'Action', 2010),
  (2, 'Aki and Pawpaw', 'Mike', 'Comedy', 2015),
  (3, 'Blind Date', 'Samuel', 'Drama', 2012),
  (4, 'Poor Love', 'Kenneth', 'Sci-Fi', 2020),
  (5, 'All out of Love', 'Kingsley', 'Horror', 2008),
  (6, 'Flash', 'Huntas', 'Thriller', 2017),
  (7, 'Hunter Zombie', 'Ola', 'Adventure', 2011),
  (8, 'Sanke Girl', 'Zinny', 'Romance', 2019),
  (9, 'Zinny Gueen', 'Ebuka', 'Fantasy', 2014),
  (10, 'Bami is Here', 'Amaka', 'Mystery', 2016);


INSERT INTO subscribers VALUES
  (1, 'John', 'john@gmail.com', 'Premium', '2023-01-15'),
  (2, 'Jane', 'jane@gmail.com', 'Basic', '2023-02-01'),
  (3, 'Johnson', 'michael@gmail.com', 'Premium', '2023-03-10'),
  (4, 'Davis', 'davis@gmail.com', 'Basic', '2023-04-05'),
  (5, 'Daniel', 'daniel@gmail.com', 'Premium', '2023-05-20'),
  (6, 'Sarah', 'sarah@gmail.com', 'Basic', '2023-06-15'),
  (7, 'Anderson', 'anderson@gmail.com', 'Premium', '2023-02-28'),
  (8, 'Martinez', 'olivi@gmail.com', 'Basic', '2023-04-10'),
  (9, 'Andrew', 'andrewlee@gmaile.com', 'Premium', '2023-06-01'),
  (10, 'Samantha', 'samantha@gmail.com', 'Basic', '2023-03-15');
  
  
  INSERT INTO rentals VALUES
  (1, 1, 1, '2023-01-05', '2023-01-10'),
  (2, 2, 2, '2023-02-10', '2023-02-15'),
  (3, 3, 3, '2023-03-15', '2023-03-20'),
  (4, 4, 4, '2023-04-20', '2023-04-25'),
  (5, 5, 5, '2023-05-25', '2023-05-30'),
  (6, 6, 6, '2023-06-05', '2023-06-10'),
  (7, 7, 7, '2023-02-15', '2023-02-20'),
  (8, 8, 8, '2023-04-25', '2023-04-30'),
  (9, 9, 9, '2023-06-10', '2023-06-15'),
  (10, 10, 10, '2023-03-20', '2023-03-25');

#Adding a new movie
INSERT INTO movies (movie_id, title, director, genre, release_year)
VALUES (1, 'Movie Title', 'Director Name', 'Genre', 2021);

#Subscribing a new user:
INSERT INTO subscribers (subscriber_id, name, email, subscription_plan, subscription_date)
VALUES (1, 'John Doe', 'johndoe@example.com', 'Premium', '2023-06-30');

#Renting a movie to a subscriber:
INSERT INTO rentals (rental_id, movie_id, subscriber_id, rental_date)
VALUES (1, 1, 1, '2023-06-30');


#Returning a movie
UPDATE rentals
SET return_date = '2023-07-05'
WHERE rental_id = 1;


#Most popular movies (based on total rentals)
SELECT movies.title, COUNT(rentals.rental_id) AS rental_count
FROM movies
JOIN rentals ON movies.movie_id = rentals.movie_id
GROUP BY movies.title
ORDER BY rental_count DESC;

#Active subscribers
SELECT *
FROM subscribers
WHERE subscription_date <= CURDATE();

#Movies rented by a particular subscriber
SELECT movies.title, rentals.rental_date, rentals.return_date
FROM movies
JOIN rentals ON movies.movie_id = rentals.movie_id
WHERE rentals.subscriber_id = 1;


#Total rentals in a specific period
SELECT COUNT(rental_id) AS total_rentals
FROM rentals
WHERE rental_date >= '2023-01-01' AND rental_date <= '2023-06-30';
