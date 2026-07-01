/*INSTAGRAM DB CLONE*/

CREATE DATABASE instagram_clone;

CREATE TABLE users(
   id INT PRIMARY KEY AUTO_INCREMENT,
   username VARCHAR(100) UNIQUE NOT NULL,
   created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
   id INT PRIMARY KEY AUTO_INCREMENT,
   image_url VARCHAR(500) NOT NULL,
   user_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW(),
   FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments(
   id INT PRIMARY KEY AUTO_INCREMENT,
   comment_text VARCHAR(2000) NOT NULL,
   user_id INT NOT NULL,
   photo_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW(),
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
   user_id INT NOT NULL,
   photo_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW(),
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (photo_id) REFERENCES photos(id),
   UNIQUE(user_id, photo_id)
   -- PRIMARY KEY(user_id, photo_id) -- we can use this as well
);

CREATE TABLE follows(
  follower_id INT,
  followee_id INT,
  CHECK (follower_id != followee_id),
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followee_id) REFERENCES users(id),
  PRIMARY KEY (follower_id, followee_id)
-- UNIQUE(user_id, photo_id)we can use but 
-- then we need to add NULL as in ... 30 and 31
);

CREATE TABLE tags (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tag_name VARCHAR(50) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() -- OR NOW()
);

CREATE TABLE photo_tags(
  tag_id INT,
  photo_id INT,
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  PRIMARY KEY (tag_id, photo_id)
)

