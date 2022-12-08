--Part 3: Write Algorithms 
---create sequence
create sequence seq_hw8_log

DECLARE 
  ---List of all transaction that I need to process 
    CURSOR cur_transaction IS 
    SELECT * 
    FROM   hw8_transaction; 
    v_count_nr       NUMBER; 
    v_log_cd         VARCHAR(25); 
    v_log_message_tx VARCHAR(150); 
    rec_customer hw8_customer%ROWTYPE; 
    rec_account hw8_account%ROWTYPE; 
    rec_customer_account_info   hw8_customer_account_view%ROWTYPE; 
    
BEGIN 
  ----get a list of each transaction 
  FOR each_trans IN cur_transaction LOOP 
  null;
    --dbms_output.put_line(each_trans.transaction_pk||' : '||each_trans.customer_fk||' : '||each_trans.pin||' : '||each_trans.account_fk||' : '||each_trans.amount);
    --start processing each transaction 
    BEGIN 
    ----filter customers who has a valid id
                  SELECT * 
                  INTO   rec_customer_account_info 
                  FROM   hw8_customer_account_view
                  WHERE  customer_pk=each_trans.customer_fk;     
            EXCEPTION WHEN no_data_found THEN NULL; 
            END; 
            --dbms_output.put_line('pin:'||rec_customer.pin);
            
            IF rec_customer_account_info.customer_pk IS NOT NULL THEN 
    ---When Customer Id is valid, check the pin number
               IF rec_customer_account_info.pin=each_trans.pin THEN 
                --DBMS_OUTPUT.PUT_LINE(rec_customer.customer_pk||rec_customer.PIN);
    ---When Customer Id and pin are all good, check the account ID
                    select count(*)
                    into v_count_nr
                    from hw8_account
                    where customer_fk=each_trans.customer_fk
                    and account_pk=each_trans.account_fk;
                    --DBMS_OUTPUT.put_line(v_count_nr);
                          If v_count_nr=1 then
                            null;  
                    ---check if account is good, account found, check if the amount is negative
                            if each_trans.amount>0 THEN
                             null;  
                             
                               If each_trans.type='Deposit' Then
                                    UPDATE hw8_account 
                                    SET    balance =balance+each_trans.amount 
                                    WHERE  account_pk=each_trans.account_fk;  
                                    ---the deposit is success
                                    v_log_cd :='SUCCESS'; 
                                    v_log_message_tx :='Success Deposit'; 
                                ELSIF each_trans.type='Withdraw' Then                                    
                    ---account is found, amount is postive, check if the balance is enough for the withdraw
                                    IF rec_customer_account_info.balance >=each_trans.amount THEN 
                                        --fund is sufficient 
                                        UPDATE hw8_account 
                                        SET    balance =balance-each_trans.amount 
                                        WHERE  account_pk=each_trans.account_fk 
                                        AND    balance >=each_trans.amount; 
                                       ---the withdraw is success
                                        v_log_cd :='SUCCESS'; 
                                        v_log_message_tx :='Success Withdraw'; 
                                    ELSE 
                                    --Insufficient Funds, fail the withdraw money 
                                    v_log_cd :='ERROR'; 
                                    v_log_message_tx :='Insufficient Funds'; 
                                    END IF; 
                                End If;
                              ELSE 
                              --Amount is negative, reject the withdraw or deposit process
                              v_log_cd :='ERROR'; 
                              v_log_message_tx :='Invalid Process: Negative amount'; 
                            END IF;       
                                                                             
                            ELSE 
                              --invalid account number, fail the withdraw money 
                              v_log_cd :='ERROR'; 
                              v_log_message_tx :='Invalid Account Id'; 
                            END IF; 
                      ELSE 
                      --Invalid Pin, fail the withdraw money 
                        v_log_cd :='ERROR'; 
                        v_log_message_tx :='Invalid Pin'; 
                      END IF; 
                ELSE 
                --Customer does not exist in our system, fail the withdraw money 
                  v_log_cd :='ERROR'; 
                  v_log_message_tx :='Customer Does Not Exist'; 
                END IF; 
                
 ----keep track all records into log table           
    INSERT INTO hw8_log 
                ( 
                            log_pk, 
                            log_type, 
                            description, 
                            transaction_fk 
                ) 
                VALUES 
                ( 
                            seq_hw8_log.NEXTVAL, 
                            v_log_cd, 
                            v_log_message_tx, 
                            each_trans.transaction_pk 
                ); 

 END LOOP; 
END;