CREATE TABLE user_table(
  id int PRIMARY KEY,
  userName TEXT,
  email INT,
  phone TEXT,
  userType TEXT

);

CREATE TABLE event_table(
     id int PRIMARY KEY,
     eventName TEXT,
     eventDescription TEXT,
     beginDate TEXT,
     endDate TEXT,
     ticketingBeginDate TEXT,
     ticketingEndDate TEXT,
     eventCategory TEXT,
     eventCategoryId TEXT,
     eventType TEXT,
     organizerName TEXT,
     tinNumber TEXT
);