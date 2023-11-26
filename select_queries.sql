-- TASK 2
-- task 2_1
SELECT track_name, track_duration
FROM tracks
ORDER BY track_duration DESC
LIMIT 1;

-- task 2_2
SELECT track_name
FROM tracks
WHERE track_duration >= 210;

-- task 2_3
SELECT compilation_name 
FROM compilations
WHERE release_year BETWEEN '2018-01-01' AND '2020-12-31';

-- task 2_4
SELECT artist_name
FROM artists
WHERE POSITION(' ' IN artist_name) = 0;

-- task 2_5.1
SELECT track_name
FROM tracks
WHERE
  track_name ILIKE 'my %' OR track_name ILIKE 'мой %' OR
  track_name ILIKE '% my' OR track_name ILIKE '% мой' OR
  track_name ILIKE '% my %' OR track_name ILIKE '% мой %' OR
  track_name ILIKE 'my' OR track_name ILIKE 'мой'
ORDER BY track_name;

-- task 2_5.2
SELECT track_name
FROM tracks
WHERE
  string_to_array(lower(track_name), ' ') && ARRAY['my', 'мой']
ORDER BY track_name;

-- task 2_5.3
SELECT track_name
FROM tracks
WHERE
  track_name ~* '\m(my|мой)\M'
ORDER BY track_name;

-- TASK 3
-- task 3_1
SELECT c.category_name, COUNT(ca.artist_id) AS artist_count
FROM categories c
LEFT JOIN categories_artists ca ON c.category_id = ca.category_id
GROUP BY c.category_name;

-- task 3_2
SELECT COUNT(*) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31';

-- task 3_3
SELECT a.album_name, AVG(t.track_duration) AS average_duration
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_name;

-- task 3_4
SELECT artist_name
FROM artists ar
WHERE NOT EXISTS (
    SELECT 1
    FROM albums_artists aa
    JOIN albums a ON aa.album_id = a.album_id
    WHERE aa.artist_id = ar.artist_id AND EXTRACT(YEAR FROM a.release_year) = 2020
);

-- task 3_5
SELECT c.compilation_name
FROM compilations c
JOIN compilations_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN albums_artists aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Artist2';

-- TASK 4
-- task 4_1
SELECT DISTINCT a.album_name
FROM albums a
JOIN albums_artists aa1 ON a.album_id = aa1.album_id
JOIN albums_artists aa2 ON a.album_id = aa2.album_id AND aa1.artist_id <> aa2.artist_id
JOIN categories_artists ca1 ON aa1.artist_id = ca1.artist_id
JOIN categories_artists ca2 ON aa2.artist_id = ca2.artist_id AND ca1.category_id <> ca2.category_id
GROUP BY a.album_name
HAVING COUNT(DISTINCT ca1.category_id) > 1 OR COUNT(DISTINCT ca2.category_id) > 1;

-- task 4_2
SELECT DISTINCT t.track_name
FROM tracks t
LEFT JOIN compilations_tracks ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;

-- task 4_3
SELECT ar.artist_name, t.track_name, t.track_duration
FROM artists ar
JOIN albums_artists aa ON ar.artist_id = aa.artist_id
JOIN albums a ON aa.album_id = a.album_id
JOIN tracks t ON a.album_id = t.album_id
WHERE t.track_duration = (SELECT MIN(track_duration) FROM tracks);

-- task 4_4
SELECT a.album_name
FROM albums a
LEFT JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_name
HAVING COUNT(t.track_id) = (
    SELECT COUNT(track_id) AS track_count
    FROM tracks
    GROUP BY album_id
    ORDER BY track_count
    LIMIT 1
);