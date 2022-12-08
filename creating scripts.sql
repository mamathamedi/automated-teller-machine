CREATE TABLE hw8_account (
    account_pk        NUMBER NOT NULL,
    balance           NUMBER,
    customer_fk       NUMBER NOT NULL,
    account_type_fk   NUMBER NOT NULL
);

ALTER TABLE hw8_account ADD CONSTRAINT hw8_account_pk PRIMARY KEY ( account_pk );

CREATE TABLE hw8_account_type (
    account_type_pk   NUMBER NOT NULL,
    account_type      VARCHAR2(30)
);

ALTER TABLE hw8_account_type ADD CONSTRAINT hw8_account_type_pk PRIMARY KEY ( account_type_pk );

CREATE TABLE hw8_customer (
    customer_pk   NUMBER NOT NULL,
    first_name    VARCHAR2(50),
    last_name     VARCHAR2(50),
    pin           VARCHAR2(10)
);

ALTER TABLE hw8_customer ADD CONSTRAINT hw8_customer_pk PRIMARY KEY ( customer_pk );

CREATE TABLE hw8_log (
    log_pk           NUMBER NOT NULL,
    log_type         VARCHAR2(25),
    description      VARCHAR2(4000),
    transaction_fk   NUMBER NOT NULL
);

ALTER TABLE hw8_log ADD CONSTRAINT hw8_log_pk PRIMARY KEY ( log_pk );

CREATE TABLE hw8_transaction (
    transaction_pk   NUMBER NOT NULL,
    customer_fk      NUMBER,
    pin              VARCHAR2(10),
    account_fk       NUMBER,
    amount           NUMBER,
    type             VARCHAR2(15)
);

ALTER TABLE hw8_transaction ADD CONSTRAINT hw8_transaction_pk PRIMARY KEY ( transaction_pk );

ALTER TABLE hw8_account
    ADD CONSTRAINT hw8_account_account_type_fk FOREIGN KEY ( account_type_fk )
        REFERENCES hw8_account_type ( account_type_pk );

ALTER TABLE hw8_account
    ADD CONSTRAINT hw8_account_customer_fk FOREIGN KEY ( customer_fk )
        REFERENCES hw8_customer ( customer_pk );

ALTER TABLE hw8_log
    ADD CONSTRAINT hw8_log_hw8_transaction_fk FOREIGN KEY ( transaction_fk )
        REFERENCES hw8_transaction ( transaction_pk );
