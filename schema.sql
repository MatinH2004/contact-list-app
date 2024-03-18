CREATE TABLE contacts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  number TEXT,
  email TEXT,
  category_id INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL
);

-- Dummy Text

INSERT INTO contacts (name, number, email, category_id)
VALUES
    ('John Doe', '1234567890', 'john.doe@example.com', 1),
    ('Jane Smith', '0987654321', 'jane.smith@example.com', 2),
    ('Michael Johnson', '5551234567', 'michael.johnson@example.com', 3),
    ('Emily Davis', '9876543210', 'emily.davis@example.com', 1),
    ('Christopher Brown', '4567890123', 'christopher.brown@example.com', 2),
    ('Amanda Wilson', '3216549870', 'amanda.wilson@example.com', 3),
    ('James Taylor', '7890123456', 'james.taylor@example.com', 1),
    ('Sarah Martinez', '2345678901', 'sarah.martinez@example.com', 2),
    ('Matthew Anderson', '8901234567', 'matthew.anderson@example.com', 3),
    ('Jennifer Garcia', '6789012345', 'jennifer.garcia@example.com', 1),
    ('David Rodriguez', '4321098765', 'david.rodriguez@example.com', 2),
    ('Jessica Lopez', '9012345678', 'jessica.lopez@example.com', 3),
    ('Robert Lee', '5678901234', 'robert.lee@example.com', 1),
    ('Megan Hernandez', '2109876543', 'megan.hernandez@example.com', 2),
    ('William Gonzalez', '3456789012', 'william.gonzalez@example.com', 3),
    ('Lauren Smith', '6789012345', 'lauren.smith@example.com', 1),
    ('Daniel Perez', '9876543210', 'daniel.perez@example.com', 2),
    ('Ashley Campbell', '6543210987', 'ashley.campbell@example.com', 3),
    ('Christopher Jackson', '3210987654', 'christopher.jackson@example.com', 1),
    ('Stephanie Hill', '8765432109', 'stephanie.hill@example.com', 2),
    ('Joseph Torres', '5432109876', 'joseph.torres@example.com', 3),
    ('Kimberly Nguyen', '1098765432', 'kimberly.nguyen@example.com', 1),
    ('Ryan Flores', '4321098765', 'ryan.flores@example.com', 2),
    ('Elizabeth Kim', '7654321098', 'elizabeth.kim@example.com', 3),
    ('Andrew Patel', '8765432109', 'andrew.patel@example.com', 1),
    ('Samantha Collins', '3210987654', 'samantha.collins@example.com', 2),
    ('Tyler Chang', '6543210987', 'tyler.chang@example.com', 3),
    ('Hannah Rivera', '2109876543', 'hannah.rivera@example.com', 1),
    ('Brandon Martin', '5432109876', 'brandon.martin@example.com', 2),
    ('Nicole Nguyen', '9876543210', 'nicole.nguyen@example.com', 3);
