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

SELECT username, photos.id, REPLACE(SUBSTRING(image_url, 9), '.', ' '), COUNT(*) as likes FROM photos
JOIN likes ON likes.photo_id = photos.id
JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY likes DESC LIMIT 1; 
-- if we use primary key then we can SELECT related, specific, unique data.
-- bcz primary_key is related to a specific, unique data - one value not full row
-- so we can get the related one row of data


SELECT username, COUNT(*) FROM users
JOIN photos ON users.id = photos.user_id
GROUP BY username; -- every user avg post

SELECT ROUND((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users))
AS avg_post; 
-- avg post by our users

SELECT tag_name, COUNT(*) AS tag_count FROM photo_tags 
JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY tag_count DESC LIMIT 5;

SELECT user_id, COUNT(*) FROM users
JOIN likes ON likes.user_id = users.id
GROUP BY user_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM photos);
