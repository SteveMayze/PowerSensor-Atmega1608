SELECT
    -- id,
    -- created,
    module,
    message
FROM
    lw_sqllog
    where created > sysdate -1
    order by created;
    
    
-- END{"response": "FAIL", "sql-code": "-1400", 
-- "sql-error":"ORA-01400: cannot insert NULL into ("LEAWOOD_DEV"."LW_DEVICE"."CLASS")"}    


--  7E 
-- 00 25 
-- 10
-- 00 
-- 00 13 A2 00 41 5C 0F 82 
-- FF FE
-- 00 00 
-- 11 26 NODE_TOKEN_HEADER_OPERATION NODE_TOKEN_NODEINTRO
-- 12 9C 01 F3 01 80 81 91 81 90 FF NODE_TOKEN_HEADER_SERIAL_ID
-- 13 41 NODE_TOKEN_HEADER_DOMAIN NODE_METADATA_DOMAIN_POWER
-- 14 51 NODE_TOKEN_HEADER_CLASS NODE_METADATA_CLASS_SENSOR
-- 30 31 NODE_TOKEN_PROPERTY_BUS_VOLTAGE
-- 30 32 NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE
-- 30 33 NODE_TOKEN_PROPERTY_LOAD_CURRENT
-- B4





