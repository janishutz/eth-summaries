CREATE TABLE TableName (
    Attribute integer,
    OtherAttribute varchar (30),
    NextAttribute character (2) default "AP", -- default value, if unset on insert
    PRIMARY KEY (Attribute) -- primary key, as in RA
);
