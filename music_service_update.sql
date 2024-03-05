
CREATE TABLE Artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(50)
);

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

CREATE TABLE Artists_Genres (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(50),
    release_year INT CHECK (release_year >= 2020)
);

CREATE TABLE Artists_Albums (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE Tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(50),
    duration INT CHECK (duration >= 180),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE Compilations (
    compilation_id INT PRIMARY KEY,
    compilation_name VARCHAR(50),
    release_year INT CHECK (release_year >= 2020)
);

CREATE TABLE Compilation_Tracks (
    compilation_id INT,
    track_id INT,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilations(compilation_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id)
);