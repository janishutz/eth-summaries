INSERT INTO TableName (
    Attribute,
    OtherAttribute
) VALUES ( 1000, 'Value' );

DELETE FROM TableName WHERE Attribute > 50;

UPDATE TableName SET Attribute = Attribute + 1;

-- Import data from a CSV file (this is pgsql specific syntax)
COPY TableName FROM '/data.csv' WITH FORMAT csv;
