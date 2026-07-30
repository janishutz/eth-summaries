CREATE TABLE TableName (
    Attribute integer UNIQUE,
    OtherAttribute varchar(30) NOT NULL, -- Not null
    NextAttribute character(2) default "AP", -- default value, if unset on insert
    PRIMARY KEY (Attribute), -- primary key, as in RA
    CHECK (Attribute > 1)
);
