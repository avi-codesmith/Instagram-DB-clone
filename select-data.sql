SELECT * FROM users
ORDER BY created_at
LIMIT 5;

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

SELECT username, "INACTIVE" AS STATUS
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

SELECT 
username,
IF(photos.id IS NULL, "INACTIVE", "ACTIVE") AS STATUS 
FROM users
LEFT JOIN photos 
 ON users.id = photos.user_id;

SELECT username, photos.id, image_url, COUNT(*) as likes FROM photos
JOIN likes ON likes.photo_id = photos.id
JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY likes DESC LIMIT 1; 
-- if we use primary key then we can SELECT related, specific, unique data.
-- bcz primary_key is related to a specific, unique data - one value not full row
-- so we can get the related one row of data
 