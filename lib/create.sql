CREATE TABLE projects (
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT,
  category TEXT,
  funding_goal INTEGER,
  start_date DATE,
  end_date DATE
);

CREATE TABLE users (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  age INTEGER
);

CREATE TABLE pledges (
  id INTEGER NOT NULL PRIMARY KEY,
  amount INTEGER,
  user_id INTEGER,
  project_id INTEGER,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(project_id) REFERENCES projects(id)
);
