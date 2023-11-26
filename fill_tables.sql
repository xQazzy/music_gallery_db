INSERT INTO categories (category_name) VALUES
    ('Pop'),
    ('Rock'),
    ('Hip-Hop');

INSERT INTO artists (artist_name) VALUES
    ('Artist1'),
    ('Artist2'),
    ('Artist3'),
    ('Artist4');

INSERT INTO categories_artists (category_id, artist_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (1, 4);

INSERT INTO albums (album_name, release_year) VALUES
    ('Album1', '2020-01-01'),
    ('Album2', '2018-02-15'),
    ('Album3', '2015-05-20');

INSERT INTO albums_artists (album_id, artist_id) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3),
    (3, 4);

INSERT INTO compilations (compilation_name, release_year) VALUES
    ('Compilation1', '2019-07-10'),
    ('Compilation2', '2021-04-05'),
    ('Compilation3', '2017-11-30');

INSERT INTO tracks (track_name, track_duration, album_id) VALUES
    ('Track1', 180, 1),
    ('Track2', 210, 1),
    ('Track3', 160, 2),
    ('Track4', 200, 2),
    ('Track5', 190, 3),
    ('Track6', 220, 3),
    ('Track7', 1800, 2),
    ('My best of the best', 260, 2),
    ('Myself', 280, 3),
    ('Bemy', 10, 3),
    ('Мой худший день', 90, 3),
    ('И друг мой грузовик...', 400, 1),
    ('Мой', 400, 1),
    ('Мойка', 350, 3);

INSERT INTO compilations_tracks (compilation_id, track_id) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6);