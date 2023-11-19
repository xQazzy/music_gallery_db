SELECT track_name, track_duration
FROM tracks
ORDER BY track_duration DESC
LIMIT 1;

SELECT track_name
FROM tracks
WHERE track_duration >= 210;

SELECT compilation_name 
FROM compilations
WHERE release_year BETWEEN '2018-01-01' AND '2020-12-31';

SELECT artist_name
FROM artists
WHERE POSITION(' ' IN artist_name) = 0;

SELECT track_name
FROM tracks
WHERE LOWER(track_name) LIKE '%мой%' OR LOWER(track_name) LIKE '%my%';

SELECT c.category_name, COUNT(ca.artist_id) AS artist_count
FROM categories c
LEFT JOIN categories_artists ca ON c.category_id = ca.category_id
GROUP BY c.category_name;

SELECT COUNT(*) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31';

SELECT a.album_name, AVG(t.track_duration) AS average_duration
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_name;

SELECT ar.artist_name
FROM artists ar
LEFT JOIN albums_artists aa ON ar.artist_id = aa.artist_id
LEFT JOIN albums a ON aa.album_id = a.album_id
WHERE (a.release_year IS NULL OR a.release_year != '2020-01-01');

SELECT c.compilation_name
FROM compilations c
JOIN compilations_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN albums_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Artist2';

SELECT DISTINCT a.album_name
FROM albums a
JOIN albums_artists aa1 ON a.album_id = aa1.album_id
JOIN albums_artists aa2 ON aa1.album_id = aa2.album_id AND aa1.artist_id <> aa2.artist_id;

SELECT DISTINCT t.track_name
FROM tracks t
LEFT JOIN compilations_tracks ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;

SELECT ar.artist_name, t.track_name, t.track_duration
FROM artists ar
JOIN albums_artists aa ON ar.artist_id = aa.artist_id
JOIN albums a ON aa.album_id = a.album_id
JOIN tracks t ON a.album_id = t.album_id
WHERE t.track_duration = (SELECT MIN(track_duration) FROM tracks);

SELECT a.album_name
FROM albums a
LEFT JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_name
HAVING COUNT(t.track_id) = (SELECT MIN(track_count) FROM (SELECT COUNT(track_id) AS track_count FROM tracks GROUP BY album_id) AS min_counts);