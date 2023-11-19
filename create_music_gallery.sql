CREATE TABLE IF NOT EXISTS categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(60) UNIQUE
);

CREATE TABLE IF NOT EXISTS artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS categories_artists (
    category_id INTEGER REFERENCES categories(category_id),
    artist_id INTEGER REFERENCES artists(artist_id),
    CONSTRAINT pk_categories_artists PRIMARY KEY (category_id, artist_id)
);

CREATE TABLE IF NOT EXISTS albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255),
    release_year DATE CHECK (release_year >= '1900-01-01')
);

CREATE TABLE IF NOT EXISTS albums_artists (
    album_id INTEGER REFERENCES albums(album_id),
    artist_id INTEGER REFERENCES artists(artist_id),
    CONSTRAINT pk_albums_artists PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS compilations (
    compilation_id SERIAL PRIMARY KEY,
    compilation_name VARCHAR(255),
    release_year DATE CHECK (release_year >= '1900-01-01')
);

CREATE TABLE IF NOT EXISTS tracks (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255),
    track_duration INTEGER,
    album_id INTEGER NOT NULL REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS compilations_tracks (
    compilation_id INTEGER REFERENCES compilations(compilation_id),
    track_id INTEGER REFERENCES tracks(track_id),
    CONSTRAINT pk_compilations_tracks PRIMARY KEY (compilation_id, track_id)
);