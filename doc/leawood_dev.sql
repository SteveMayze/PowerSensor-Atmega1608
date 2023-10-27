SELECT
    -- id,
    created,
    module,
    message
FROM
    lw_sqllog
    where created > to_date('27-OCT-23 08.00', 'dd-mon-rr hh24.mi')
    order by created;
    
SELECT
    s.device_id,
    md.def_name,
    s.point_timestamp,
    s.point_value,
    md.unit
FROM
    lw_data_series s, lw_data_def md
where md.def_id = s.def_id
  and point_timestamp > to_date('27-OCT-23 08.00', 'dd-mon-rr hh24.mi')
  order by s.point_timestamp;
    
SELECT
    def_id,
    def_name,
    unit,
    multiplier,
    description,
    symbol,
    label,
    class,
    domain,
    token
FROM
    lw_data_def;
    
TRUNCATE TABLE lw_sqllog;


    
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




a3 90 11 32 73 3e 11 ee
