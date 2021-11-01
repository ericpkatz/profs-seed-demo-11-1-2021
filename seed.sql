DROP TABLE IF EXISTS entries_tags;
DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS journals;
DROP TABLE IF EXISTS tags;

CREATE TABLE journals (
  id INTEGER PRIMARY KEY,
  title VARCHAR(100) NOT NULL
);

CREATE TABLE entries (
  id INTEGER PRIMARY KEY,
  txt VARCHAR(200),
  journal_id INTEGER REFERENCES journals(id) NOT NULL
);

CREATE TABLE tags(
  id INTEGER PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);

CREATE TABLE entries_tags(
  id INTEGER PRIMARY KEY,
  entry_id INTEGER REFERENCES entries(id),
  tag_id INTEGER REFERENCES tags(id)
);

INSERT INTO journals(id, title) VALUES(1, 'CODING');
INSERT INTO journals(id, title) VALUES(2, 'COOKING');
INSERT INTO journals(id, title) VALUES(3, 'MOVIES');

INSERT INTO entries(id, txt, journal_id) VALUES (
  1,
  'WHEN HARRY MET SALLY',
  3
);
INSERT INTO entries(id, txt, journal_id) VALUES (
  2,
  'THE GODFATHER',
  3
);

INSERT INTO tags(id, name) VALUES (1, 'GREAT'), (2, 'ROMANTIC'), (3, 'YUMMY'); 

INSERT INTO entries_tags(id, entry_id, tag_id) VALUES (1, 1, 2);
INSERT INTO entries_tags(id, entry_id, tag_id) VALUES (2, 1, 1);

SELECT journals.id as journal_id, title, txt, entries.id as entry_id
FROM journals
LEFT JOIN entries
ON entries.journal_id = journals.id;
--WHERE title like 'CO%';
SELECT name AS tag_name, entries.txt as entry_txt
FROM entries_tags
JOIN entries
ON entries.id = entries_tags.entry_id
JOIN tags
ON tags.id = entries_tags.tag_id;