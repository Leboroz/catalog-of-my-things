/* init table for item */

CREATE TABLE item (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date: DATE,
    publisher VARCHAR(100),
    cover_state VARCHAR(10),
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY(genre_id) references genre(id) ON DELETE
    SET
        NULL ON UPDATE CASCADE
    FOREIGN KEY(label_id) references label(id) ON DELETE
    SET
        NULL ON UPDATE CASCADE
    FOREIGN KEY(author_id) references author(id) ON DELETE
    SET
        NULL ON UPDATE CASCADE
)

/* init table for game */
CREATE TABLE game (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date: DATE,
    publisher VARCHAR(100),
    cover_state VARCHAR(10),
    genre_id INT,
    author_id INT,
    label_id INT,
    multiplayer BOOLEAN,
    last_played_at DATE,
    FOREIGN KEY(author_id) references author(id) ON DELETE
    SET
        NULL ON UPDATE CASCADE
)

/* init author table */

CREATE TABLE author(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);