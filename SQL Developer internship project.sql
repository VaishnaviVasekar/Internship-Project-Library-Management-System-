CREATE TABLE Books (
  book_id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(50),
  publisher_id INT,
  genre VARCHAR(100),
  published_year int,
  is_available bit ,
  FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
)


CREATE TABLE Members (
  member_id INT PRIMARY KEY identity,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15),
  membership_date DATE DEFAULT  getdate()
);


CREATE TABLE Librarians (
  librarian_id INT PRIMARY KEY ,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE,
  contact_number VARCHAR(15),
  joined_date DATE DEFAULT getdate()
);



CREATE TABLE Issued_Status (
  issue_id INT PRIMARY KEY identity,
  book_id INT,
  member_id INT,
  issue_date DATE DEFAULT getdate(),
  due_date DATE,
  FOREIGN KEY (book_id) REFERENCES Books(book_id),
  FOREIGN KEY (member_id) REFERENCES Members(member_id)
);



CREATE TABLE Return_Status (
  return_id INT PRIMARY KEY ,
  issue_id INT,
  return_date DATE,
  FOREIGN KEY (issue_id) REFERENCES Issued_Status(issue_id)
);




CREATE TABLE Publisher (
  publisher_id INT PRIMARY KEY identity,
  name VARCHAR(255) NOT NULL,
  contact_email VARCHAR(100),
  phone VARCHAR(15)
);




CREATE TABLE Fines (
  fine_id INT PRIMARY KEY ,
  member_id INT,
  book_id INT,
  due_date DATE,
  return_date DATE,
  fine_amount DECIMAL(6,2),
  is_paid bit DEFAULT 0,
  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);



CREATE TABLE Feedback (
  feedback_id INT PRIMARY KEY identity,
  member_id INT,
  book_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  feedback_date DATE DEFAULT getdate(),
  FOREIGN KEY (member_id) REFERENCES Members(member_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);




CREATE TABLE Digital_Material (
  digital_id INT PRIMARY KEY identity,
  book_id INT,
  format VARCHAR(50), -- e.g., PDF, ePub, Video
  access_link TEXT,
  upload_date DATE DEFAULT getdate(),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);



CREATE TABLE Notifications (
  notification_id INT PRIMARY KEY identity,
  member_id INT,
  message TEXT,
  sent_date DATE DEFAULT getdate(),
  FOREIGN KEY (member_id) REFERENCES Members(member_id)
)