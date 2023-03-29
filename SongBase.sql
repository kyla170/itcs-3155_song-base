DROP DATABASE IF EXISTS songbase;

CREATE DATABASE IF NOT EXISTS songbase;

USE songbase;

CREATE TABLE IF NOT EXISTS song (
    song_id INT AUTO_INCREMENT NOT NULL,
    song_title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    time_duration TIME NOT NULL,
    genre_id INT NULL,
    is_explicit BOOL NULL DEFAULT 0,
    song_url VARCHAR(255) NULL,
    PRIMARY KEY (song_id)
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id) ON UPDATE CASCADE ON DELETE SET NULL
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS artist (
    artist_id INT AUTO_INCREMENT NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NULL,
    birth_date DATE NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS genre (
    genre_id INT AUTO_INCREMENT NOT NULL,
    genre_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    pass_word VARCHAR(255) NOT NULL,
    account_type VARCHAR(255) NOT NULL,
    favorites_id INT NOT NULL,
    playlist_id INT NULL,
    PRIMARY KEY (user_id)
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id) ON UPDATE CASCADE ON DELETE SET NULL
    FOREIGN KEY (favorites_id) REFERENCES favorites(favorites_id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS playlist (
    playlist_id INT AUTO_INCREMENT NOT NULL,
    track_order INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (playlist_id)
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS favorites (
    playlist_id INT AUTO_INCREMENT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (playlist_id)
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO song (song_id, song_title, artist_id, time_duration, genre_id, is_explicit)
VALUES
    (1, 'Chosen', 1, 00:03:31, NULL, FALSE, NULL)
    (2, 'Love I Need', 1, 00:03:33, NULL, FALSE, NULL)
    (3, 'H.A.Y.', 6, 00:03:44, 5, FALSE, NULL)
    (4, 'Wake Up Dead', 2, 00:03:20, NULL, FALSE, NULL)
    (5, 'Breathing', 2, 00:04:19, NULL, FALSE, NULL)
    (6, 'Down With The Sickness', 3, 00:03:36, 2, TRUE, NULL)
    (7, 'Let Spirits Ride', 4, 00:04:21, 1, FALSE, NULL)
    (8, 'The Can Can Song', 5, 00:02:11, 3, FALSE, NULL)
;

INSERT INTO song (genre_id, genre_name)
VALUES
    (1, 'Rock')
    (2, 'Metal')
    (3, 'Orchestra')
    (4, 'Pop')
    (5, 'Electronic')
;

INSERT INTO artist (artist_id, artist_name, first_name, last_name, birth_date)
VALUES
    (1, 'The Living Tombstone', 'Yoav', 'Landau', NULL)
    (2, 'Faded Paper Figures', NULL, NULL, NULL)
    (3, 'Disturbed', NULL, NULL, NULL)
    (4, 'Black Mountain', NULL, NULL, NULL)
    (5, 'Offenbach', 'Jacques', 'Offenbach', NULL)
    (6, 'Clark', NULL, NULL, NULL)
;

INSERT INTO user (user_id, first_name, last_name, email, pass_word, favorites_id, playlist_id)
VALUES
    (1, 'Kyla', 'Moore', 'kmoor170@uncc.edu', 'peepaw2001', 1, NULL)
;

INSERT INTO favorites (playlist_id, song_id)
VALUES
    (1, 1)
    (1, 2)
    (1, 4)
    (1, 5)
;