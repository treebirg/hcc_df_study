DROP TABLE IF EXISTS study_session;
CREATE TABLE study_session (
  session_id INTEGER PRIMARY KEY,
  murmur_id TEXT UNIQUE,
  blue_participant TEXT UNIQUE,
  red_participant TEXT UNIQUE,
  grpc_port NUMBER UNIQUE,
  murmur_port NUMBER UNIQUE
);

DROP TABLE IF EXISTS game;
CREATE TABLE game (
  game_id TEXT PRIMARY KEY,
  game_data TEXT,
  is_current BOOL,
  session_id INTEGER,
  game_order INTEGER,
  FOREIGN KEY(session_id) REFERENCES study_session(session_id)
);

DROP TABLE IF EXISTS attack;
CREATE TABLE attack(
  attack_id INTEGER PRIMARY KEY,
  game_id TEXT,
  session_id TEXT,
  round INTEGER,
  source_user TEXT,
  target_user TEXT,
  audio_path TEXT,
  FOREIGN KEY(session_id) REFERENCES study_session(session_id),
  FOREIGN KEY(game_id) REFERENCES game(game_id)
);
