-- =========================
-- TABLE
-- =========================
CREATE TABLE IF NOT EXISTS contacts (
   id SERIAL PRIMARY KEY,
   name VARCHAR(100),
   phone VARCHAR(20)
);
-- =========================
-- FUNCTION: search
-- =========================
CREATE OR REPLACE FUNCTION search_contacts(p TEXT)
RETURNS TABLE(name VARCHAR, phone VARCHAR) AS $$
BEGIN
   RETURN QUERY
   SELECT name, phone
   FROM contacts
   WHERE name ILIKE '%' || p || '%'
      OR phone ILIKE '%' || p || '%';
END;
$$ LANGUAGE plpgsql;
-- =========================
-- FUNCTION: pagination
-- =========================
CREATE OR REPLACE FUNCTION get_contacts_paginated(lim INT, off INT)
RETURNS TABLE(name VARCHAR, phone VARCHAR) AS $$
BEGIN
   RETURN QUERY
   SELECT name, phone
   FROM contacts
   LIMIT lim OFFSET off;
END;
$$ LANGUAGE plpgsql;
-- =========================
-- PROCEDURE: add / update
-- =========================
CREATE OR REPLACE PROCEDURE upsert_contact(p_name VARCHAR, p_phone VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
   IF EXISTS (SELECT 1 FROM contacts WHERE name = p_name) THEN
       UPDATE contacts SET phone = p_phone WHERE name = p_name;
   ELSE
       INSERT INTO contacts(name, phone)
       VALUES (p_name, p_phone);
   END IF;
END;
$$;
-- =========================
-- PROCEDURE: delete
-- =========================
CREATE OR REPLACE PROCEDURE delete_contact(p_value VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
   DELETE FROM contacts
   WHERE name = p_value OR phone = p_value;
END;
$$;
-- =========================
-- TEST DATA
-- =========================
CALL upsert_contact('Ali', '87771234567');
CALL upsert_contact('Bek', '87001234567');