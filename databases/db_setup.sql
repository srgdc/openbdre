-- initial setup and populating the metadata tables

-- populating exec_status
DELETE FROM  exec_status ;
INSERT INTO  exec_status  ( exec_state_id , description ) VALUES (1,'NOT RUNNING');
INSERT INTO  exec_status  ( exec_state_id , description ) VALUES (2,'RUNNING');
INSERT INTO  exec_status  ( exec_state_id , description ) VALUES (3,'SUCCESS');
INSERT INTO  exec_status  ( exec_state_id , description ) VALUES (4,'PAUSED');
INSERT INTO  exec_status  ( exec_state_id , description ) VALUES (5,'SUSPENDED');
INSERT INTO  exec_status  ( exec_state_id , description ) VALUES (6,'FAILED');

-- populating batch_status
DELETE FROM  batch_status ;
INSERT INTO  batch_status  ( batch_state_id , description ) VALUES (0,'New');
INSERT INTO  batch_status  ( batch_state_id , description ) VALUES (1,'Processed');
INSERT INTO  batch_status  ( batch_state_id , description ) VALUES (2,'Accessed');

-- populating deploy_status
DELETE FROM  deploy_status ;
insert into deploy_status values (1,'Not started');
insert into deploy_status values (2,'Running');
insert into deploy_status values (3,'Success');
insert into deploy_status values (4,'Fail');
insert into deploy_status values (5,'Picked');

-- populating process_type
DELETE FROM  process_type ;
insert into process_type values (1,'ingestion',null);
insert into process_type values (2, 'Semantic', null);
insert into process_type values (3, 'Export', null);
insert into process_type values (4, 'Data Extraction', null);
insert into process_type values (5, 'Hive Data Load', null);
insert into process_type values (6, 'Raw Load', 5);
insert into process_type values (7, 'Stage Load', 5);
insert into process_type values (8, 'Base Load', 5);
insert into process_type values (9, 'Hive Action', 2);
insert into process_type values (10, 'Pig Action', 2);
insert into process_type values (11, 'Map Reduce', 2);
insert into process_type values (12, 'SFTP', 1);
insert into process_type values (13, 'Data Import', 4);
insert into process_type values (14, 'Hive Generation', 18);
insert into process_type values (15, 'File Registration', null);
insert into process_type values (16, 'DQ', 19);
insert into process_type values (17, 'Data Export', 3);
insert into process_type values (18, 'Hive Generation_Parent', null);
insert into process_type values (19, 'DQ_Parent', null);
insert into process_type values (20, 'MQ_Parent', null);
insert into process_type values (21, 'MQ Step', 20);
-- adding shell action to execute shell scripts,python script and INFA BDE jobs
insert into process_type values (22,'Shell Action',2);
insert into process_type values (23,'Flume Action',1);
insert into process_type values (24,"R Action",2);
insert into process_type values (25,"Spark Action",2);


-- populating workflow_type

DELETE FROM  workflow_type ;
insert into workflow_type values (0, 'for steps only');
insert into workflow_type values (1, 'oozie');
insert into workflow_type values (2, 'stand alone');

-- populating bus_domain
INSERT INTO  bus_domain  ( bus_domain_id , description , bus_domain_name , bus_domain_owner ) VALUES (1,'Corporate Security Analytics','Corporate Security Analytics','Arijit');


INSERT INTO  batch  (batch_id, source_instance_exec_id, batch_type) values (0, null, 'Type0');
INSERT INTO  batch  (batch_id, source_instance_exec_id, batch_type) values (1, null, 'Type0');
-- INSERT INTO  batch  (batch_id,source_instance_exec_id,batch_type)values(2,null,'type0')


insert into servers values(123461,'hdfs','localhost','','','','','127.0.0.1');

-- populating lineage_node_type
insert into lineage_node_type values (1,'table');
insert into lineage_node_type values (2,'column');
insert into lineage_node_type values (3,'function');
insert into lineage_node_type values (4,'temp_table');
insert into lineage_node_type values (5,'idle_column');
insert into lineage_node_type values (6,'constant');

-- populating lineage_query_type
insert into lineage_query_type values (1,'HIVE');
insert into lineage_query_type values (2,'PIG');

INSERT INTO process_template (process_template_id, description, add_ts, process_name, bus_domain_id, process_type_id, can_recover, next_process_template_id, delete_flag, workflow_id) VALUES (0, 'default process',current_timestamp,'default process', 1, 1,  1, '0',  0, 0);

--populating process_template for postgres
INSERT INTO process_template (process_template_id, description, add_ts, process_name, bus_domain_id, process_type_id, can_recover, next_process_template_id, delete_flag, workflow_id) VALUES (0, 'default process',current_timestamp,'default process', 1, 1,  true, '0',  false, 0);


-- populating general_config


insert into general_config values( 1,'credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);
-- Ingestion

insert into general_config values('2','credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);
-- Semantic

insert into general_config values('3','credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);
-- Export

insert into general_config values('4','credential','CredentialConfiguration','Credentials for authentication',1,'true|false','option', 1);
-- Data Extraction

insert into general_config values('5','credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);
-- Hive Data Load

-- insert into general_config values('6','','','', 1,true,'text', 1)
-- Raw Load

-- insert into general_config values('7','','','', 1,true,'text', 1)
-- Stage Load

-- insert into general_config values('8','','','', 1,true,'text', 1)
-- Base Load

-- Hive Action
insert into general_config values('9','param','Parameters','Additional parameters', 1,'true','text', 1);
insert into general_config values('9','query','Query file location','Query file location', 1,'true','file', 1);

-- Pig Action
insert into general_config values('10','param','Parameters','Additional parameters', 1,'true','text', 1);
insert into general_config values('10','script','Script location','Script location', 1,'true','file', 1);

-- Map Reduce
insert into general_config values('11','param','Parameters','Additional parameters', 1,'true','text', 1);

insert into general_config values('11','program','Program Main Class','Program main class', 1,'true','text', 1);


-- SFTP
-- insert into general_config values('12','','','', 1,true,'text', 1)

-- RDBMS import step
insert into general_config values('13','imp-common','Import Configuration','RDBMS Import Configuration', 1,'true','text', 1);

-- Test Data generation step
insert into general_config values('14','data','Data-generate Configuration',' ', 1,'true','text', 1);
insert into general_config values('14','table','table Schema Configuration',' ', 1,'true','text', 1);

-- File Registration
insert into general_config values('15','credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);

-- DQ step
insert into general_config values('16','dq','DQ Configuration','Data Quality configuration', 1,'true','text', 1);

-- Export Step
insert into general_config values('17','exp-common','Export Configuration','RDBMS Export Configuration', 1,'true','text', 1);

-- Hive Generation_Parent
insert into general_config values('18','credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);


-- DQ_Parent
insert into general_config values('19','credential','Credential Configuration','Credentials for authentication',1,'true|false','option', 1);

-- MQ_Parent
insert into general_config values('20','credential','CredentialConfiguration','Credentials for authentication',1,'true|false','option', 1);

-- MQ Step
insert into general_config values('21','mqimport','MQ Import Configuration','Messaging Queue import configuration', 1,'true','text', 1);

-- Shell Action
insert into general_config values('22','param','Parameters','Additional parameters', 1,'true','text', 1);
insert into general_config values('22','script','Script location',' ', 1,'true','file', 1);

-- Flume Action
insert into general_config values('23','flume','Flume Configuration','Flume', 1,'true','text', 1);



-- Populating general config for default insert properties

 -- File Registration
insert into general_config values('default_val.15','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);

insert into general_config values('default_val.5','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);
-- Hive Data Load

-- insert into general_config values('default_val.6','','','', 1,true,'text', 1)
-- Raw Load

-- insert into general_config values('default_val.7','','','', 1,true,'text', 1)
-- Stage Load

-- insert into general_config values('default_val.8','','','', 1,true,'text', 1)
-- Base Load

insert into general_config values('default_val.2','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);
-- Semantic

-- Hive Action
-- Pig Action
-- Shell Action

-- Map Reduce

insert into general_config values('default_val.11','mainClass','program','Program file location',1,'','text', 1);

-- SFTP
-- insert into general_config values('default_val.12','','','', 1,true,'text', 1)


insert into general_config values('default_val.4','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);
-- Data Extraction

-- RDBMS import step
insert into general_config values('default_val.13','check.col','imp-common','properties for data import',1,'default_column','text', 1);
insert into general_config values('default_val.13','columns','imp-common','properties for data import',1,'default_cols','text', 1);
insert into general_config values('default_val.13','db','imp-common','properties for data import',1,'default_db','text', 1);
insert into general_config values('default_val.13','driver','imp-common','properties for data import',1,'com.mysql.jdbc.Driver','text', 1);
insert into general_config values('default_val.13','file.layout','imp-common','properties for data import',1,'TextFile','text', 1);
insert into general_config values('default_val.13','import','imp-common','properties for data import',1,'1','text', 1);
insert into general_config values('default_val.13','incr.mode','imp-common','properties for data import',1,'None','text', 1);
insert into general_config values('default_val.13','mappers','imp-common','properties for data import',1,'1','text', 1);
insert into general_config values('default_val.13','password','imp-common','properties for data import',1,'db_password','text', 1);
insert into general_config values('default_val.13','table','imp-common','properties for data import',1,'default_table','text', 1);
insert into general_config values('default_val.13','username','imp-common','properties for data import',1,'db_username','text', 1);

insert into general_config values('default_val.3','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);
-- Export

-- Export Step
insert into general_config values('default_val.17','db','exp-common','properties for data export',1,'default_db','text', 1);
insert into general_config values('default_val.17','driver','exp-common','properties for data export',1,'com.mysql.jdbc.Driver','text', 1);
insert into general_config values('default_val.17','table','exp-common','properties for data export',1,'default_table','text', 1);
insert into general_config values('default_val.17','mappers','exp-common','properties for data export',1,'1','text', 1);
insert into general_config values('default_val.17','password','exp-common','properties for data export',1,'db_password','text', 1);
insert into general_config values('default_val.17','username','exp-common','properties for data export',1,'db_username','text', 1);

-- Hive Generation_Parent
insert into general_config values('default_val.18','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);

-- Test Data generation step
insert into general_config values('testDataGen','data-gen-id.1','data','Generating Date',1,'randomDate','text', 1);
insert into general_config values('testDataGen','data-gen-id.2','data','Generating number',1,'randomNumber','text', 1);
insert into general_config values('testDataGen','data-gen-id.3','data','Generating String',1,'randomRegexPattern','text', 1);


-- DQ_Parent
insert into general_config values('default_val.19','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);

-- DQ step
insert into general_config values('default_val.16','file.delimiter.regex','dq','File delimiter',1,',','text', 1);
insert into general_config values('default_val.16','min.pass.threshold.percent','dq','Min pass threshold percentage',1,'90','text', 1);
insert into general_config values('default_val.16','rules.package','dq','rules package',1,'com.wipro.ats.bdre.bank','text', 1);
insert into general_config values('default_val.16','rules.password','dq','rules password',1,'def_password','text', 1);
insert into general_config values('default_val.16','rules.username','dq','rules user name',1,'default_user','text', 1);

-- MQ_Parent
insert into general_config values('default_val.20','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);

-- MQ Step
insert into general_config values('default_val.21','broker.url','mqimport','Broker URL of Active MQ',1,'tcp://localhost:61616','text', 1);
insert into general_config values('default_val.21','num.bolts','mqimport','Number of bolts/parallel message processors',1,'1','text', 1);
insert into general_config values('default_val.21','num.spouts','mqimport','Number of spouts/parallel message consumer',1,'1','text', 1);
insert into general_config values('default_val.21','queue.name','mqimport','Name of the Queue of ActiveMQ',1,'default_QueueName','text', 1);


insert into general_config values('default_val.1','password_enabled','credential','Credentials for authentication', 1,'true','text', 1);
-- Ingestion

-- Flume general configurations

-- Types of Sink Type Supported in flume
insert into general_config values ('Sink_Type','hdfs','HDFS','Data will be stored in hdfs', 0,'hdfs','text', 1);
insert into general_config values ('Sink_Type','com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink','BDRE HDFS','Data will be stored in hdfs and output file will be registered in BDRE metadata', 0,'com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink','text', 1);
insert into general_config values ('Sink_Type','hive','HIVE','Data will be stored in hive', 0,'hive','text', 1);
insert into general_config values ('Sink_Type','logger','Logger','Sink is used for testing and debuggin purpose', 0,'logger','text', 1);
insert into general_config values ('Sink_Type','avro','Avro',' Flume events sent to this sink are turned into Avro events and sent to the configured hostname / port pair.', 0,'avro','text', 1);
insert into general_config values ('Sink_Type','thrift','Thrift','Flume events sent to this sink are turned into Thrift events and sent to the configured hostname / port pair', 0,'thrift','text', 1);
insert into general_config values ('Sink_Type','irc','IRC','The IRC sink takes messages from attached channel and relays those to configured IRC destinations', 0,'irc','text', 1);
insert into general_config values ('Sink_Type','file_roll','File Roll','Stores events on the local filesystem', 0,'file_roll','text', 1);
insert into general_config values ('Sink_Type','null','Null','Discards all events it receives from the channel', 0,'null','text', 1);
insert into general_config values ('Sink_Type','hbase','HBase','This sink writes data to HBase', 0,'hbase','text', 1);
insert into general_config values ('Sink_Type','asynchbase','Async HBase','This sink writes data to HBase using an asynchronous model', 0,'asynchbase','text', 1);
insert into general_config values ('Sink_Type','org.apache.flume.sink.solr.morphline.MorphlineSolrSink','Morphline Solr Sink','This sink extracts data from Flume events, transforms it, and loads it in near-real-time into Apache Solr servers, which in turn serve queries to end users or search applications', 0,'org.apache.flume.sink.solr.morphline.MorphlineSolrSink','text', 1);
insert into general_config values ('Sink_Type','org.apache.flume.sink.elasticsearch.ElasticSearchSink','Elastic Search Sink','This sink writes data to an elasticsearch cluster. By default, events will be written so that the Kibana graphical interface can display them - just as if logstash wrote them', 0,'org.apache.flume.sink.elasticsearch.ElasticSearchSink','text', 1);
insert into general_config values ('Sink_Type','org.apache.flume.sink.kite.DatasetSink','Dataset Sink','Experimental sink that writes events to a Kite Dataset. This sink will deserialize the body of each incoming event and store the resulting record in a Kite Dataset. It determines target Dataset by loading a dataset by URI', 0,'org.apache.flume.sink.kite.DatasetSink','text', 1);
insert into general_config values ('Sink_Type','org.apache.flume.sink.kafka.KafkaSink','Kafka Sink','This is a Flume Sink implementation that can publish data to a Kafka topic', 0,'org.apache.flume.sink.kafka.KafkaSink','text', 1);
insert into general_config values ('Sink_Type','FQCN','FQCN','A custom sink is your own implementation of the Sink interface. A custom sink’s class and its dependencies must be included in the agent’s classpath when starting the Flume agent.', 0,'FQCN','text', 1);

-- Properties associated with hdfs sink

insert into general_config values ('hdfs_Sink','hdfs.path','HDFS Path','Path is HDFS where you want to put files',1,'/user/bdreusr/flume/%H','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.filePrefix','File Prefix','Name prefixed to files created by Flume in hdfs directory', 0,'IngestedData','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.fileSuffix','File Suffix','Name suffixed to files created by Flume in hdfs directory', 0,'%H%M%S','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.inUsePrefix','In Use Prefix','Prefix that is used for temporal files that flume actively writes into', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.inUseSuffix','In Use Suffix','Prefix that is used for temporal files that flume actively writes into', 0,'.tmp','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.rollInterval','Roll Interval','Number of seconds to wait before rolling current file (0 = never roll based on time interval)', 0,'0','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.rollSize','Roll Size','File size to trigger roll, in bytes (0: never roll based on file size)', 0,'0','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.rollCount','Roll Count','Number of events written to file before it rolled (0 = never roll based on number of events)', 0,'0','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.idleTimeout','Idle TimeOut','Timeout after which inactive files get closed (0 = disable automatic closing of idle files)', 0,'0','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.batchSize','Batch Size','number of events written to file before it is flushed to HDFS', 0,'100','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.codeC','Codec','Compression codec. one of following : gzip, bzip2, lzo, lzop, snappy', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.fileType','File Type','File format: currently SequenceFile, DataStream or CompressedStream (1)DataStream will not compress output file and please don’t set codeC (2)CompressedStream requires set hdfs.codeC with an available codeC', 0,'SequenceFile','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.maxOpenFiles','Max Open Files','Allow only this number of open files. If this number is exceeded, the oldest file is closed.', 0,'5000','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.minBlockReplicas','Min Block Replicas','Specify minimum number of replicas per HDFS block. If not specified, it comes from the default Hadoop config in the classpath.', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.writeFormat','Write Format','Format for sequence file records. One of “Text” or “Writable” (the default).', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.callTimeout','Call Timeout','Number of milliseconds allowed for HDFS operations, such as open, write, flush, close. This number should be increased if many HDFS timeout operations are occurring.', 0,'10000','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.threadsPoolSize','Threads Pool Size','Number of threads per HDFS sink for HDFS IO ops (open, write, etc.)', 0,'10','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.rollTimerPoolSize','Roll Timer Pool Size','Number of threads per HDFS sink for scheduling timed file rolling', 0,'1','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.kerberosPrincipal','Kerberos Principal','Kerberos user principal for accessing secure HDFS', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.kerberosKeytab','Kerberos Keytab','Kerberos keytab for accessing secure HDFS', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.proxyUser','HDFS Proxy User','HDFS proxy user', 0,null,'text', 1);
insert into general_config values ('hdfs_Sink','hdfs.round','HDFS Round','Should the timestamp be rounded down (if  1, affects all time based escape sequences except %t)', 0,'false','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.roundValue','HDFS Round Value','Rounded down to the highest multiple of this (in the unit configured using hdfs.roundUnit), less than current time.', 0,'1','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.roundUnit','HDFS Round Unit','The unit of the round down value - second, minute or hour.', 0,'second','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.timeZone','HDFS Time Zone','Name of the timezone that should be used for resolving the directory path', 0,'Local Time','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.useLocalTimeStamp','Local Time Stamp','Use the local time (instead of the timestamp from the event header) while replacing the escape sequences.', 0,'true','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.closeTries','Close Tries','Number of times the sink must try renaming a file, after initiating a close attempt. If set to 1, this sink will not re-try a failed rename (due to, for example, NameNode or DataNode failure), and may leave the file in an open state with a .tmp extension. If set to 0, the sink will try to rename the file until the file is eventually renamed (there is no limit on the number of times it would try). The file may still remain open if the close call fails but the data will be intact and in this case, the file will be closed only after a Flume restart.', 0,'0','text', 1);
insert into general_config values ('hdfs_Sink','hdfs.retryInterval','Retry Interval','Time in seconds between consecutive attempts to close a file. Each close call costs multiple RPC round-trips to the Namenode, so setting this too low can cause a lot of load on the name node. If set to 0 or less, the sink will not attempt to close the file if the first attempt fails, and may leave the file open or with a ”.tmp” extension.', 0,'180','text', 1);
insert into general_config values ('hdfs_Sink','serializer','Serializer','Other possible options include avro_event or the fully-qualified class name of an implementation of the EventSerializer.Builder interface.', 0,'TEXT','text', 1);

-- Properties associated with bdre hdfs sink

insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.path','HDFS Path','Path is HDFS where you want to put files',1,'/user/bdreusr/flume/%H','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.filePrefix','File Prefix','Name prefixed to files created by Flume in hdfs directory', 0,'IngestedData','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.fileSuffix','File Suffix','Name suffixed to files created by Flume in hdfs directory', 0,'%H%M%S','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.inUsePrefix','In Use Prefix','Prefix that is used for temporal files that flume actively writes into', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.inUseSuffix','In Use Suffix','Prefix that is used for temporal files that flume actively writes into', 0,'.tmp','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.rollInterval','Roll Interval','Number of seconds to wait before rolling current file (0 = never roll based on time interval)', 0,'0','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.rollSize','Roll Size','File size to trigger roll, in bytes (0: never roll based on file size)', 0,'0','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.rollCount','Roll Count','Number of events written to file before it rolled (0 = never roll based on number of events)', 0,'0','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.idleTimeout','Idle TimeOut','Timeout after which inactive files get closed (0 = disable automatic closing of idle files)', 0,'0','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.batchSize','Batch Size','number of events written to file before it is flushed to HDFS', 0,'100','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.codeC','Codec','Compression codec. one of following : gzip, bzip2, lzo, lzop, snappy', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.fileType','File Type','File format: currently SequenceFile, DataStream or CompressedStream (1)DataStream will not compress output file and please don’t set codeC (2)CompressedStream requires set hdfs.codeC with an available codeC', 0,'SequenceFile','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.maxOpenFiles','Max Open Files','Allow only this number of open files. If this number is exceeded, the oldest file is closed.', 0,'5000','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.minBlockReplicas','Min Block Replicas','Specify minimum number of replicas per HDFS block. If not specified, it comes from the default Hadoop config in the classpath.', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.writeFormat','Write Format','Format for sequence file records. One of “Text” or “Writable” (the default).', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.callTimeout','Call Timeout','Number of milliseconds allowed for HDFS operations, such as open, write, flush, close. This number should be increased if many HDFS timeout operations are occurring.', 0,'10000','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.threadsPoolSize','Threads Pool Size','Number of threads per HDFS sink for HDFS IO ops (open, write, etc.)', 0,'10','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.rollTimerPoolSize','Roll Timer Pool Size','Number of threads per HDFS sink for scheduling timed file rolling', 0,'1','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.kerberosPrincipal','Kerberos Principal','Kerberos user principal for accessing secure HDFS', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.kerberosKeytab','Kerberos Keytab','Kerberos keytab for accessing secure HDFS', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.proxyUser','HDFS Proxy User','HDFS proxy user', 0,null,'text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.round','HDFS Round','Should the timestamp be rounded down (if  1, affects all time based escape sequences except %t)', 0,'false','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.roundValue','HDFS Round Value','Rounded down to the highest multiple of this (in the unit configured using hdfs.roundUnit), less than current time.', 0,'1','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.roundUnit','HDFS Round Unit','The unit of the round down value - second, minute or hour.', 0,'second','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.timeZone','HDFS Time Zone','Name of the timezone that should be used for resolving the directory path', 0,'Local Time','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.useLocalTimeStamp','Local Time Stamp','Use the local time (instead of the timestamp from the event header) while replacing the escape sequences.', 0,'true','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.closeTries','Close Tries','Number of times the sink must try renaming a file, after initiating a close attempt. If set to 1, this sink will not re-try a failed rename (due to, for example, NameNode or DataNode failure), and may leave the file in an open state with a .tmp extension. If set to 0, the sink will try to rename the file until the file is eventually renamed (there is no limit on the number of times it would try). The file may still remain open if the close call fails but the data will be intact and in this case, the file will be closed only after a Flume restart.', 0,'0','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','hdfs.retryInterval','Retry Interval','Time in seconds between consecutive attempts to close a file. Each close call costs multiple RPC round-trips to the Namenode, so setting this too low can cause a lot of load on the name node. If set to 0 or less, the sink will not attempt to close the file if the first attempt fails, and may leave the file open or with a ”.tmp” extension.', 0,'180','text', 1);
insert into general_config values ('com.wipro.ats.bdre.flume.sink.hdfs.BDREHDFSEventSink_Sink','serializer','Serializer','Other possible options include avro_event or the fully-qualified class name of an implementation of the EventSerializer.Builder interface.', 0,'TEXT','text', 1);

-- -- Properties associated with hive sink

insert into general_config values ('hive_Sink','hive.metastore','Hive MetaStore','Hive metastore URI ',1,'thrift://localhost:9083 ','text', 1);
insert into general_config values ('hive_Sink','hive.database','Hive Database','Hive Database name',1,'base','text', 1);
insert into general_config values ('hive_Sink','hive.table','Hive Table','Hive Table name',1,'ingested_data','text', 1);
insert into general_config values ('hive_Sink','hive.partition','Hive Partition','Comma separate list of partition values identifying the partition to write to', 0,null,'text', 1);
insert into general_config values ('hive_Sink','hive.txnsPerBatchAsk','Hive Transaction Per Batch','Hive grants a batch of transactions instead of single transactions to streaming clients like Flume. This setting configures the number of desired transactions per Transaction Batch. Data from all transactions in a single batch end up in a single file. Flume will write a maximum of batchSize events in each transaction in the batch. This setting in conjunction with batchSize provides control over the size of each file. Note that eventually Hive will transparently compact these files into larger files.', 0,'100','text', 1);
insert into general_config values ('hive_Sink','heartBeatInterval','Heart Beat Interval','(In seconds) Interval between consecutive heartbeats sent to Hive to keep unused transactions from expiring. Set this value to 0 to disable heartbeats.', 0,'240','text', 1);
insert into general_config values ('hive_Sink','autoCreatePartitions','Auto Create Partitions','Flume will automatically create the necessary Hive partitions to stream to', 0,'true','text', 1);
insert into general_config values ('hive_Sink','batchSize','Batch Size','Max number of events written to Hive in a single Hive transaction', 0,'15000','text', 1);
insert into general_config values ('hive_Sink','maxOpenConnections','Max Open Connections','Allow only this number of open connections. If this number is exceeded, the least recently used connection is closed.', 0,'500','text', 1);
insert into general_config values ('hive_Sink','callTimeout','Call Timeout','(In milliseconds) Timeout for Hive and HDFS I/O operations, such as openTxn, write, commit, abort.', 0,'10000','text', 1);
insert into general_config values ('hive_Sink','serializer','Hive Partition','Serializer is responsible for parsing out field from the event and mapping them to columns in the hive table. Choice of serializer depends upon the format of the data in the event. Supported serializers: DELIMITED and JSON', 0,null,'text', 1);
insert into general_config values ('hive_Sink','roundUnit','Round Unit','The unit of the round down value - second, minute or hour.', 0,'minute','text', 1);
insert into general_config values ('hive_Sink','roundValue','Round Value','Rounded down to the highest multiple of this (in the unit configured using hive.roundUnit), less than current time', 0,'1','text', 1);
insert into general_config values ('hive_Sink','timeZone','Time Zone','Name of the timezone that should be used for resolving the escape sequences in partition', 0,'Local Time','text', 1);
insert into general_config values ('hive_Sink','useLocalTimeStamp','Use Local TimeStamp','Use the local time (instead of the timestamp from the event header) while replacing the escape sequences.', 0,'true','text', 1);
insert into general_config values ('hive_Sink','serializer.delimiter','Serializer Delimiter','(Type: string) The field delimiter in the incoming data. To use special characters, surround them with double quotes like “\t”', 0,',','text', 1);
insert into general_config values ('hive_Sink','serializer.fieldnames','Serializer Field Names','The mapping from input fields to columns in hive table. Specified as a comma separated list (no spaces) of hive table columns names, identifying the input fields in order of their occurrence. To skip fields leave the column name unspecified. Eg. ‘time,,ip,message’ indicates the 1st, 3rd and 4th fields in input map to time, ip and message columns in the hive table.', 0,null,'text', 1);
insert into general_config values ('hive_Sink','serializer.serdeSeparator','Serializer Serde Separator','(Type: character) Customizes the separator used by underlying serde. There can be a gain in efficiency if the fields in serializer.fieldnames are in same order as table columns, the serializer.delimiter is same as the serializer.serdeSeparator and number of fields in serializer.fieldnames is less than or equal to number of table columns, as the fields in incoming event body do not need to be reordered to match order of table columns. Use single quotes for special characters like ‘\t’. Ensure input fields do not contain this character. NOTE: If serializer.delimiter is a single character, preferably set this to the same character', 0,'Ctrl-A','text', 1);

-- Properties associated with logger sink

insert into general_config values ('logger_Sink','maxBytesToLog','Max Bytes To Log','Maximum number of bytes of the Event body to log ', 0,'16','text', 1);

-- Properties associated with avro sink

insert into general_config values ('avro_Sink','hostname','Hostname','The hostname or IP address to bind to.', 1,'localhost','text', 1);
insert into general_config values ('avro_Sink','port','Port','The port -- to listen on.', 1,'8080','text', 1);
insert into general_config values ('avro_Sink','batch-size','Batch Size','number of event to batch together for send.', 0,'100','text', 1);
insert into general_config values ('avro_Sink','connect-timeout','Connect Timeout','Amount of time (ms) to allow for the first (handshake) request.', 0,'20000','text', 1);
insert into general_config values ('avro_Sink','request-timeout','Request Timeout','Amount of time (ms) to allow for requests after the first.', 0,'20000','text', 1);
insert into general_config values ('avro_Sink','reset-connection-interval','Reset Connection Interval','Amount of time (s) before the connection to the next hop is reset. This will force the Avro Sink to reconnect to the next hop. This will allow the sink to connect to hosts behind a hardware load-balancer when news hosts are added without having to restart the agent.', 0,'none','text', 1);
insert into general_config values ('avro_Sink','compression-type','Compression Type','This can be “none” or “deflate”. The compression-type must match the compression-type of matching AvroSource', 0,'none','text', 1);
insert into general_config values ('avro_Sink','compression-level','Compression Level','The level of compression to compress event. 0 = no compression and 1-9 is compression. The higher the number the more compression', 0,'6','text', 1);
insert into general_config values ('avro_Sink','ssl','Ssl','Set to  1 to enable SSL for this AvroSink. When configuring SSL, you can optionally set a “truststore”, “truststore-password”, “truststore-type”, and specify whether to “trust-all-certs”.', 0,'false','text', 1);
insert into general_config values ('avro_Sink','trust-all-certs','Trust All Certs','If this is set to  1, SSL server certificates for remote servers (Avro Sources) will not be checked. This should NOT be used in production because it makes it easier for an attacker to execute a man-in-the-middle attack and “listen in” on the encrypted connection.', 0,'false','text', 1);
insert into general_config values ('avro_Sink','truststore','Truststore','The path to a custom Java truststore file. Flume uses the certificate authority information in this file to determine whether the remote Avro Source’s SSL authentication credentials should be trusted. If not specified, the default Java JSSE certificate authority files (typically “jssecacerts” or “cacerts” in the Oracle JRE) will be used.', 0,null,'text', 1);
insert into general_config values ('avro_Sink','truststore-password','Truststore Password','The password for the specified truststore.', 0,null,'text', 1);
insert into general_config values ('avro_Sink','truststore-type','Truststore Type','The type of the Java truststore. This can be “JKS” or other supported Java truststore type.', 0,'JKS','text', 1);
insert into general_config values ('avro_Sink','exclude-protocols','Exclud Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 will always be excluded in addition to the protocols specified.', 0,'SSLv3','text', 1);
insert into general_config values ('avro_Sink','maxIoWorkers','Max IO Workers','The maximum number of I/O worker threads. This is configured on the NettyAvroRpcClient NioClientSocketChannelFactory.', 0,'2 * the number of available processors in the machine','text', 1);

-- Properties associated with thrift sink

insert into general_config values('thrift_Sink','hostname','Hostname','The hostname or IP address to bind to.', 1,'localhost','text', 1);
insert into general_config values('thrift_Sink','port','Port','The port -- to listen on.', 1,'9083','text', 1);
insert into general_config values('thrift_Sink','batch-size','Batch Size','number of event to batch together for send.', 0,'100','text', 1);
insert into general_config values('thrift_Sink','connect-timeout','Connect Timeout','Amount of time (ms) to allow for the first (handshake) request.', 0,'20000','text', 1);
insert into general_config values('thrift_Sink','request-timeout','Request Timeout','Amount of time (ms) to allow for requests after the first.', 0,'20000','text', 1);
insert into general_config values('thrift_Sink','connection-reset-interval','Connection Reset Interval','Amount of time (s) before the connection to the next hop is reset. This will force the Thrift Sink to reconnect to the next hop. This will allow the sink to connect to hosts behind a hardware load-balancer when news hosts are added without having to restart the agent.', 0,'none','text', 1);
insert into general_config values('thrift_Sink','ssl','Ssl','Set to  1 to enable SSL for this ThriftSink. When configuring SSL, you can optionally set a “truststore”, “truststore-password” and “truststore-type”', 0,'false','text', 1);
insert into general_config values('thrift_Sink','truststore','Trust Store','The path to a custom Java truststore file. Flume uses the certificate authority information in this file to determine whether the remote Thrift Source’s SSL authentication credentials should be trusted. If not specified, the default Java JSSE certificate authority files (typically “jssecacerts” or “cacerts” in the Oracle JRE) will be used.', 0,null,'text', 1);
insert into general_config values('thrift_Sink','truststore-password','Truststore Password','The password for the specified truststore.', 0,null,'text', 1);
insert into general_config values('thrift_Sink','truststore-type','Truststore Type','The type of the Java truststore. This can be “JKS” or other supported Java truststore type.', 0,'JKS','text', 1);
insert into general_config values('thrift_Sink','exclude-protocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude', 0,'SSLv3','text', 1);
insert into general_config values('thrift_Sink','kerberos','Kerberos','Set to  1 to enable kerberos authentication. In kerberos mode, client-principal, client-keytab and server-principal are required for successful authentication and communication to a kerberos enabled Thrift Source.', 0,'FALSE','text', 1);
insert into general_config values('thrift_Sink','client-principal','Client Principal','The kerberos principal used by the Thrift Sink to authenticate to the kerberos KDC.', 0,null,'text', 1);
insert into general_config values('thrift_Sink','client-keytab','Client Keytab','The keytab location used by the Thrift Sink in combination with the client-principal to authenticate to the kerberos KDC.', 0,null,'text', 1);
insert into general_config values('thrift_Sink','server-principal','Server Principal','The kerberos principal of the Thrift Source to which the Thrift Sink is configured to connect to.', 0,null,'text', 1);

-- Properties associated with IRC sink

insert into general_config values('irc_Sink','hostname','Hostname','The hostname or IP address to connect to', 1,'localhost','text', 1);
insert into general_config values('irc_Sink','port','Port','The port number of remote host to connect', 0,'6667','text', 1);
insert into general_config values('irc_Sink','nick','Nick','Nick name', 1,'irc_nick','text', 1);
insert into general_config values('irc_Sink','user','User','User name', 0,null,'text', 1);
insert into general_config values('irc_Sink','password','Password','User password', 0,null,'text', 1);
insert into general_config values('irc_Sink','chan','Chan','channel', 1,null,'text', 1);
insert into general_config values('irc_Sink','name','Name',' ', 0,null,'text', 1);
insert into general_config values('irc_Sink','splitlines','Split Lines','(boolean)', 0,null,'text', 1);
insert into general_config values('irc_Sink','splitchars','Split Chars','line separator (if you were to enter the default value into the config file, then you would need to escape the backslash, like this: “\n”)', 0,'n','text', 1);

-- Properties associated with File Roll sink

insert into general_config values('file_roll_Sink','sink.directory','Sink Directory','The directory where files will be stored', 1,'/home/bdreusr/file_roll','text', 1);
insert into general_config values('file_roll_Sink','sink.rollInterval','Sink Rollinterval','Roll the file every 30 seconds. Specifying 0 will disable rolling and cause all events to be written to a single file.', 0,'30','text', 1);
insert into general_config values('file_roll_Sink','sink.serializer','Sink Serializer','Other possible options include avro_event or the FQCN of an implementation of EventSerializer.Builder interface.', 0,'TEXT','text', 1);
insert into general_config values('file_roll_Sink','batchSize','Batch Size','Batch Size when file will close', 0,'100','text', 1);


-- Properties associated with HBase sink

insert into general_config values('hbase_Sink','table','Table','The name of the table in Hbase to write to.', 1,'ingested_data','text', 1);
insert into general_config values('hbase_Sink','columnFamily','ColumnFamily','The column family in Hbase to write to.', 1,'ingested_column','text', 1);
insert into general_config values('hbase_Sink','zookeeperQuorum','Zookeeper Quorum','The quorum spec. This is the value for the property hbase.zookeeper.quorum in hbase-site.xml', 0,null,'text', 1);
insert into general_config values('hbase_Sink','znodeParent','Z node parent','The base path for the znode for the -ROOT- region. Value of zookeeper.znode.parent in hbase-site.xml', 0,'hbase','text', 1);
insert into general_config values('hbase_Sink','batchSize','Batch size','Number of events to be written per txn.', 0,'100','text', 1);
insert into general_config values('hbase_Sink','coalesceIncrements','Coalesce increments','Should the sink coalesce multiple increments to a cell per batch. This might give better performance if there are multiple increments to a limited number of cells.', 0,'false','text', 1);
insert into general_config values('hbase_Sink','serializer','Serializer','Default increment column = “iCol”, payload column = “pCol”.', 0,'org.apache.flume.sink.hbase.SimpleHbaseEventSerializer','text', 1);
insert into general_config values('hbase_Sink','serializer.*','Serializer','Properties to be passed to the serializer.', 0,null,'text', 1);
insert into general_config values('hbase_Sink','kerberosPrincipal','Kerberos principal','Kerberos user principal for accessing secure HBase', 0,null,'text', 1);
insert into general_config values('hbase_Sink','kerberosKeytab','Kerberos keytab','Kerberos keytab for accessing secure HBase', 0,null,'text', 1);

-- Properties associated with Async HBase sink

insert into general_config values('asynchbase_Sink','table','Table','The name of the table in Hbase to write to.', 1,'ingested_data','text', 1);
insert into general_config values('asynchbase_Sink','zookeeperQuorum','Zookeeper quorum','The quorum spec. This is the value for the property hbase.zookeeper.quorum in hbase-site.xml', 0,null,'text', 1);
insert into general_config values('asynchbase_Sink','znodeParent','Znode parent','The base path for the znode for the -ROOT- region. Value of zookeeper.znode.parent in hbase-site.xml', 0,'/hbase','text', 1);
insert into general_config values('asynchbase_Sink','columnFamily','Column family','The column family in Hbase to write to.', 1,'ingested_column','text', 1);
insert into general_config values('asynchbase_Sink','batchSize','Batch size','Number of events to be written per txn.', 0,'100','text', 1);
insert into general_config values('asynchbase_Sink','coalesceIncrements','Coalesce increments','Should the sink coalesce multiple increments to a cell per batch. This might give better performance if there are multiple increments to a limited number of cells.', 0,'false','text', 1);
insert into general_config values('asynchbase_Sink','timeout','Timeout','The length of time (in milliseconds) the sink waits for acks from hbase for all events in a transaction.', 0,'60000','text', 1);
insert into general_config values('asynchbase_Sink','serializer','Serializer',' ', 0,'org.apache.flume.sink.hbase.SimpleAsyncHbaseEventSerializer','text', 1);
insert into general_config values('asynchbase_Sink','serializer.*','Serializer','Properties to be passed to the serializer.', 0,null,'text', 1);

-- Properties associated with org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink

insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','morphlineFile','Morphline file','The relative or absolute path on the local file system to the morphline configuration file. Example: /etc/flume-ng/conf/morphline.conf', 1,'/etc/flume-ng/conf/morphline.conf','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','morphlineId','Morphline id','Optional name used to identify a morphline if there are multiple morphlines in a morphline config file', 0,'null','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','batchSize','Batch size','The maximum number of events to take per flume transaction.', 0,'1000','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','batchDurationMillis','Batch duration millis','The maximum duration per flume transaction (ms). The transaction commits after this duration or when batchSize is exceeded, whichever comes first.', 0,'1000','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','handlerClass','Handler class','The FQCN of a class implementing org.apache.flume.sink.solr.morphline.MorphlineHandler', 0,'org.apache.flume.sink.solr.morphline.MorphlineHandlerImpl','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','isProductionMode','Is production mode','This flag should be enabled for mission critical, large-scale online production systems that need to make progress without downtime when unrecoverable exceptions occur. Corrupt or malformed parser input data, parser bugs, and errors related to unknown Solr schema fields produce unrecoverable exceptions.', 0,'false','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','recoverableExceptionClasses','Recoverable exception classes','Comma separated list of recoverable exceptions that tend to be transient, in which case the corresponding task can be retried. Examples include network connection errors, timeouts, etc. When the production mode flag is set to  1, the recoverable exceptions configured using this parameter will not be ignored and hence will lead to retries.', 0,'org.apache.solr.client.solrj.SolrServerException','text', 1);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','isIgnoringRecoverableExceptions','Is ignoringre coverable exceptions','This flag should be enabled, if an unrecoverable exception is accidentally misclassified as recoverable. This enables the sink to make progress and avoid retrying an event forever.', 0,'false','text', 1);

-- Properties associated with org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink

insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','hostNames','Hostnames','Comma separated list of hostname:port, if the port is not present the default port ‘9300’ will be used', 1,'localhost:9300','text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','indexName','Index name','The name of the index which the date will be appended to. Example ‘flume’ -> ‘flume-yyyy-MM-dd’ Arbitrary header substitution is supported, eg. %{header} replaces with value of named event header', 0,'flume','text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','indexType','Index type','The type to index the document to, defaults to ‘log’ Arbitrary header substitution is supported, eg. %{header} replaces with value of named event header', 0,'logs','text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','clusterName','Cluster name','Name of the ElasticSearch cluster to connect to', 0,'elasticsearch','text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','batchSize','Batch size','Number of events to be written per txn.', 0,'100','text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','ttl','Ttl','TTL in days, when set will cause the expired documents to be deleted automatically, if not set documents will never be automatically deleted. TTL is accepted both in the earlier form of integer only e.g. a1.sinks.k1.ttl = 5 and also with a qualifier ms (millisecond), s (second), m (minute), h (hour), d (day) and w (week). Example a1.sinks.k1.ttl = 5d will set TTL to 5 days. Follow http://www.elasticsearch.org/guide/reference/mapping/ttl-field/ for more information.', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','serializer','Serializer','The ElasticSearchIndexRequestBuilderFactory or ElasticSearchEventSerializer to use. Implementations of either class are accepted but ElasticSearchIndexRequestBuilderFactory is preferred.', 0,'org.apache.flume.sink.elasticsearch.ElasticSearchLogStashEventSerializer','text', 1);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','serializer.*','Serializer','Properties to be passed to the serializer.', 0,null,'text', 1);

-- Properties associated with org.apache.flume.sink.kite.DatasetSink_Sink

insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.dataset.uri','Kite Dataset Uri','URI of the dataset to open', 1,'hdfs://localhost:8020','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.repo.uri','Kite Repo Uri','URI of the repository to open (deprecated; use kite.dataset.uri instead)', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.dataset.namespace','Kite Dataset Namespace','Namespace of the Dataset where records will be written (deprecated; use kite.dataset.uri instead)', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.dataset.name','Kite Dataset Name','Name of the Dataset where records will be written (deprecated; use kite.dataset.uri instead)', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.batchSize','Kite Batchsize','Number of records to process in each batch', 0,'100','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.rollInterval','Kite Rollinterval','Maximum wait time (seconds) before data files are released', 0,'30','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.flushable.commitOnBatch','Kite Flushable Commitonbatch','If  1, the Flume transaction will be commited and the writer will be flushed on each batch of kite.batchSize records. This setting only applies to flushable datasets. When  1, it’s possible for temp files with commited data to be left in the dataset directory. These files need to be recovered by hand for the data to be visible to DatasetReaders.', 0,'true','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.syncable.syncOnBatch','Kite Syncable Synconbatch','Controls whether the sink will also sync data when committing the transaction. This setting only applies to syncable datasets. Syncing gaurentees that data will be written on stable storage on the remote system while flushing only gaurentees that data has left Flume’s client buffers. When the kite.flushable.commitOnBatch property is set to  0, this property must also be set to  0.', 0,'true','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.entityParser','Kite Entityparser','Parser that turns Flume Events into Kite entities. Valid values are avro and the fully-qualified class name of an implementation of the EntityParser.Builder interface.', 0,'avro','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.failurePolicy','Kite  Failurepolicy','Policy that handles non-recoverable errors such as a missing Schema in the Event header. The default value, retry, will fail the current batch and try again which matches the old behavior. Other valid values are save, which will write the raw Event to the kite.error.dataset.uri dataset, and the fully-qualified class name of an implementation of the FailurePolicy.Builder interface.', 0,'retry','text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.error.dataset.uri','Kite Error Dataset Uri','URI of the dataset where failed events are saved when kite.failurePolicy is set to save. Required when the kite.failurePolicy is set to save.', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','auth.kerberosPrincipal','Auth Kerberosprincipal','Kerberos user principal for secure authentication to HDFS', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','auth.kerberosKeytab','Auth Kerberoskeytab','Kerberos keytab location (local FS) for the principal', 0,null,'text', 1);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','auth.proxyUser','Auth Proxyuser','The effective user for HDFS actions, if different from the kerberos principal', 0,null,'text', 1);

-- Properties associated with Kafka Sink

insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','brokerList','Broker list','List of brokers Kafka-Sink will connect to, to get the list of topic partitions This can be a partial list of brokers, but we recommend at least two for HA. The format is comma separated list of hostname:port', 1,'localhost:8080','text', 1);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','topic','Topic','The topic in Kafka to which the messages will be published. If this parameter is configured, messages will be published to this topic. If the event header contains a “topic” field, the event will be published to that topic overriding the topic configured here.', 0,'default-flume-topic','text', 1);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','batchSize','Batch size','How many messages to process in one batch. Larger batches improve throughput while adding latency.', 0,'100','text', 1);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','requiredAcks','Required acks','How many replicas must acknowledge a message before its considered successfully written. Accepted values are 0 (Never wait for acknowledgement), 1 (wait for leader only), -1 (wait for all replicas) Set this to -1 to avoid data loss in some cases of leader failure.', 0,'1','text', 1);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','Other Kafka Producer Properties','Other Kafka Producer Properties','These properties are used to configure the Kafka Producer. Any producer property supported by Kafka can be used. The only requirement is to prepend the property name with the prefix kafka.. For example: kafka.producer.type', 0,null,'text', 1);

-- Types of Channel Type Supported in flume
insert into general_config values ('Channel_Type','memory','Memory','The events are stored in an in-memory queue with configurable max size. It’s ideal for flows that need higher throughput and are prepared to lose the staged data in the event of a agent failures', 0,'memory','text', 1);
insert into general_config values ('Channel_Type','jdbc','JDBC','The events are stored in a persistent storage that’s backed by a database. The JDBC channel currently supports embedded Derby. This is a durable channel that is ideal for flows where recoverability is important', 0,'jdbc','text', 1);
insert into general_config values ('Channel_Type','org.apache.flume.channel.kafka.KafkaChannel','Kafka','The events are stored in a Kafka cluster (must be installed separately). Kafka provides high availability and replication, so in case an agent or a kafka broker crashes, the events are immediately available to other sinks', 0,'org.apache.flume.channel.kafka.KafkaChannel','text', 1);
insert into general_config values ('Channel_Type','file','File','file channel', 0,'file','text', 1);
insert into general_config values ('Channel_Type','SPILLABLEMEMORY','Spillable Memory','The events are stored in an in-memory queue and on disk. The in-memory queue serves as the primary store and the disk as overflow', 0,'SPILLABLEMEMORY','text', 1);
insert into general_config values ('Channel_Type','org.apache.flume.channel.PseudoTxnMemoryChannel','Pseudo Txn Memory Channel','The Pseudo Transaction Channel is only for unit testing purposes and is NOT meant for production use.', 0,'org.apache.flume.channel.PseudoTxnMemoryChannel','text', 1);
insert into general_config values ('Channel_Type','FQCN','Custom','Custom channel', 0,'FQCN','text', 1);

-- Properties associated with Memory Channel

insert into general_config values ('memory_Channel','capacity','Capacity','The maximum number of events stored in the channel', 0,'100','text', 1);
insert into general_config values ('memory_Channel','transactionCapacity','Transaction capacity','The maximum number of events the channel will take from a source or give to a sink per transaction', 0,'100','text', 1);
insert into general_config values ('memory_Channel','keep-alive','Keep Alive','Timeout in seconds for adding or removing an event', 0,'3','text', 1);
insert into general_config values ('memory_Channel','byteCapacityBufferPercentage','Byte capacity buffer percentage','Defines the percent of buffer between byteCapacity and the estimated total size of all events in the channel, to account for data in headers. See below.', 0,'20','text', 1);
insert into general_config values ('memory_Channel','byteCapacity','Byte capacity','Maximum total bytes of memory allowed as a sum of all events in this channel. The implementation only counts the Event body, which is the reason for providing the byteCapacityBufferPercentage configuration parameter as well. Defaults to a computed value equal to 80% of the maximum memory available to the JVM (i.e. 80% of the -Xmx value passed on the command line). Note that if you have multiple memory channels on a single JVM, and they happen to hold the same physical events (i.e. if you are using a replicating channel selector from a single source) then those event sizes may be double-counted for channel byteCapacity purposes. Setting this value to 0 will cause this value to fall back to a hard internal limit of about 200 GB.', 0,'see description','text', 1);

-- Properties associated with jdbc Channel

insert into general_config values('jdbc_Channel','db.type','Db Type','Database vendor, needs to be DERBY.', 0,'DERBY','text', 1);
insert into general_config values('jdbc_Channel','driver.class','Driver Class','Class for vendor’s JDBC driver', 0,'org.apache.derby.jdbc.EmbeddedDriver','text', 1);
insert into general_config values('jdbc_Channel','driver.url','Driver Url','JDBC connection URL', 0,'(constructed from other properties)','text', 1);
insert into general_config values('jdbc_Channel','db.username','Db Username','User id for db connection', 0,'“sa”','text', 1);
insert into general_config values('jdbc_Channel','db.password','Db Password','password for db connection', 0,null,'text', 1);
insert into general_config values('jdbc_Channel','connection.properties.file','Connection Properties File','JDBC Connection property file path', 0,null,'text', 1);
insert into general_config values('jdbc_Channel','create.schema','Create Schema','If  1, then creates db schema if not there', 0,'true','text', 1);
insert into general_config values('jdbc_Channel','create.index','Create Index','Create indexes to speed up lookups', 0,'true','text', 1);
insert into general_config values('jdbc_Channel','create.foreignkey','Create Foreignkey',' ', 0,'true','text', 1);
insert into general_config values('jdbc_Channel','transaction.isolation','Transaction Isolation','Isolation level for db session READ_UNCOMMITTED, READ_COMMITTED, SERIALIZABLE, REPEATABLE_READ', 0,'“READ_COMMITTED”','text', 1);
insert into general_config values('jdbc_Channel','maximum.connections','Maximum Connections','Max connections allowed to db', 0,'10','text', 1);
insert into general_config values('jdbc_Channel','maximum.capacity','Maximum Capacity','Max number of events in the channel', 0,'0','text', 1);
insert into general_config values('jdbc_Channel','sysprop.*','Sysprop','DB Vendor specific properties', 0,null,'text', 1);
insert into general_config values('jdbc_Channel','sysprop.user.home','Sysprop User Home','Home path to store embedded Derby database', 0,null,'text', 1);

-- Properties associated with kafka Channel

insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','brokerList','Broker list','List of brokers in the Kafka cluster used by the channel This can be a partial list of brokers, but we recommend at least two for HA. The format is comma separated list of hostname:port', 1,'localhost:8080','text', 1);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','zookeeperConnect','Zookeeper connect','URI of ZooKeeper used by Kafka cluster The format is comma separated list of hostname:port. If chroot is used, it is added once at the end. For example: zookeeper-1:2181,zookeeper-2:2182,zookeeper-3:2181/kafka', 1,'zookeeper-1:2181,zookeeper-2:2182,zookeeper-3:2181/kafka','text', 1);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','topic','Topic','Kafka topic which the channel will use', 0,'flume-channel','text', 1);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','groupId','Group id','Consumer group ID the channel uses to register with Kafka. Multiple channels must use the same topic and group to ensure that when one agent fails another can get the data Note that having non-channel consumers with the same ID can lead to data loss.', 0,'flume','text', 1);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','parseAsFlumeEvent','Parse as flume event','Expecting Avro datums with FlumeEvent schema in the channel. This should be  1 if Flume source is writing to the channel And  0 if other producers are writing into the topic that the channel is using Flume source messages to Kafka can be parsed outside of Flume by using org.apache.flume.source.avro.AvroFlumeEvent provided by the flume-ng-sdk artifact', 0,'true','text', 1);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','readSmallestOffset','Read smallest offset','When set to  1, the channel will read all data in the topic, starting from the oldest event when  0, it will read only events written after the channel started When “parseAsFlumeEvent” is  1, this will be  0. Flume source will start prior to the sinks and this guarantees that events sent by source before sinks start will not be lost.', 0,'false','text', 1);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','Other Kafka Properties','Other Kafka Properties','These properties are used to configure the Kafka Producer and Consumer used by the channel. Any property supported by Kafka can be used. The only requirement is to prepend the property name with the prefix kafka.. For example: kafka.producer.type', 0,null,'text', 1);

-- Properties associated with file Channel

insert into general_config values('file_Channel','checkpointDir','Checkpoint dir','The directory where checkpoint file will be stored', 0,'~/.flume/file-channel/checkpoint','text', 1);
insert into general_config values('file_Channel','useDualCheckpoints','Use dual check points','Backup the checkpoint. If this is set to  1, backupCheckpointDir must be set', 0,'false','text', 1);
insert into general_config values('file_Channel','backupCheckpointDir','Backup check point dir','The directory where the checkpoint is backed up to. This directory must not be the same as the data directories or the checkpoint directory', 0,null,'text', 1);
insert into general_config values('file_Channel','dataDirs','Data dirs','Comma separated list of directories for storing log files. Using multiple directories on separate disks can improve file channel peformance', 0,'~/.flume/file-channel/data','text', 1);
insert into general_config values('file_Channel','transactionCapacity','Transaction capacity','The maximum size of transaction supported by the channel', 0,'10000','text', 1);
insert into general_config values('file_Channel','checkpointInterval','Check point interval','Amount of time (in millis) between checkpoints', 0,'30000','text', 1);
insert into general_config values('file_Channel','maxFileSize','Max file size','Max size (in bytes) of a single log file', 0,'2146435071','text', 1);
insert into general_config values('file_Channel','minimumRequiredSpace','Minimum required space','Minimum Required free space (in bytes). To avoid data corruption, File Channel stops accepting take/put requests when free space drops below this value', 0,'524288000','text', 1);
insert into general_config values('file_Channel','capacity','Capacity','Maximum capacity of the channel', 0,'1000000','text', 1);
insert into general_config values('file_Channel','keep-alive','Keep Alive','Amount of time (in sec) to wait for a put operation', 0,'3','text', 1);
insert into general_config values('file_Channel','use-log-replay-v1','Use Log Replay V1','Expert: Use old replay logic', 0,'false','text', 1);
insert into general_config values('file_Channel','use-fast-replay','Use Fast Replay','Expert: Replay without using queue', 0,'false','text', 1);
insert into general_config values('file_Channel','checkpointOnClose','Check point on close','Controls if a checkpoint is created when the channel is closed. Creating a checkpoint on close speeds up subsequent startup of the file channel by avoiding replay.', 0,'true','text', 1);
insert into general_config values('file_Channel','encryption.activeKey','Encryption Activekey','Key name used to encrypt new data', 0,null,'text', 1);
insert into general_config values('file_Channel','encryption.cipherProvider','Encryption Cipherprovider','Cipher provider type, supported types: AESCTRNOPADDING', 0,null,'text', 1);
insert into general_config values('file_Channel','encryption.keyProvider','Encryption Keyprovider','Key provider type, supported types: JCEKSFILE', 0,null,'text', 1);
insert into general_config values('file_Channel','encryption.keyProvider.keyStoreFile','Encryption Keyprovider Keystorefile','Path to the keystore file', 0,null,'text', 1);
insert into general_config values('file_Channel','encrpytion.keyProvider.keyStorePasswordFile','Encrpytion Keyprovider Keystore password file','Path to the keystore password file', 0,null,'text', 1);
insert into general_config values('file_Channel','encryption.keyProvider.keys','Encryption Keyprovider Keys','List of all keys (e.g. history of the activeKey setting)', 0,null,'text', 1);
insert into general_config values('file_Channel','encyption.keyProvider.keys.*.passwordFile','Encyption Keyprovider Keys Password file','Path to the optional key password file', 0,null,'text', 1);

-- Properties associated with SPILLABLEMEMORY Channel

insert into general_config values('SPILLABLEMEMORY_Channel','memoryCapacity','Memory capacity','Maximum number of events stored in memory queue. To disable use of in-memory queue, set this to zero.', 0,'10000','text', 1);
insert into general_config values('SPILLABLEMEMORY_Channel','overflowCapacity','Over flow capacity','Maximum number of events stored in overflow disk (i.e File channel). To disable use of overflow, set this to zero.', 0,'100000000','text', 1);
insert into general_config values('SPILLABLEMEMORY_Channel','overflowTimeout','Over flow timeout','The number of seconds to wait before enabling disk overflow when memory fills up.', 0,'3','text', 1);
insert into general_config values('SPILLABLEMEMORY_Channel','byteCapacityBufferPercentage','Byte capacity buffer percentage','Defines the percent of buffer between byteCapacity and the estimated total size of all events in the channel, to account for data in headers. See below.', 0,'20','text', 1);
insert into general_config values('SPILLABLEMEMORY_Channel','byteCapacity','Byte capacity','Maximum bytes of memory allowed as a sum of all events in the memory queue. The implementation only counts the Event body, which is the reason for providing the byteCapacityBufferPercentage configuration parameter as well. Defaults to a computed value equal to 80% of the maximum memory available to the JVM (i.e. 80% of the -Xmx value passed on the command line). Note that if you have multiple memory channels on a single JVM, and they happen to hold the same physical events (i.e. if you are using a replicating channel selector from a single source) then those event sizes may be double-counted for channel byteCapacity purposes. Setting this value to 0 will cause this value to fall back to a hard internal limit of about 200 GB.', 0,'see description','text', 1);
insert into general_config values('SPILLABLEMEMORY_Channel','avgEventSize','Avg event size','Estimated average size of events, in bytes, going into the channel', 0,'500','text', 1);
insert into general_config values('SPILLABLEMEMORY_Channel','<file channel properties>','<File Channel Properties>','Any file channel property with the exception of ‘keep-alive’ and ‘capacity’ can be used. The keep-alive of file channel is managed by Spillable Memory Channel. Use ‘overflowCapacity’ to set the File channel’s capacity.', 0,'see file channel','text', 1);

-- Properties associated with Psuedo Transaction Channel

insert into general_config values('org.apache.flume.channel.PseudoTxnMemoryChannel_Channel','capacity','Capacity','The max number of events stored in the channel', 0,'50','text', 1);
insert into general_config values('org.apache.flume.channel.PseudoTxnMemoryChannel_Channel','keep-alive','Keep Alive','Timeout in seconds for adding or removing an event', 0,'3','text', 1);

-- Types of Channel Type Supported in flume

insert into general_config values ('Source_Type','avro','Avro','Listens on Avro port and receives events from external Avro client streams', 0,'avro','text', 1);
insert into general_config values ('Source_Type','thrift','Thrift','Listens on Thrift port and receives events from external Thrift client streams', 0,'thrift','text', 1);
insert into general_config values ('Source_Type','exec','Exec','Runs a given Unix command on start-up and expects that process to continuously produce data on standard out', 0,'exec','text', 1);
insert into general_config values ('Source_Type','jms','JMS','Source reads messages from a JMS destination such as a queue or topic', 0,'jms','text', 1);
insert into general_config values ('Source_Type','spooldir','Spooling Directory','Spooling directory on disk as source', 0,'spooldir','text', 1);
insert into general_config values ('Source_Type','org.apache.flume.source.twitter.TwitterSource','Twitter flume','Source that connects via Streaming API to the 1% sample twitter firehose', 0,'org.apache.flume.source.twitter.TwitterSource','text', 1);
insert into general_config values ('Source_Type','com.cloudera.flume.source.TwitterSource','Twitter BDRE','Source that connects via Streaming API to twitter and generate events in JSON format', 0,'com.cloudera.flume.source.TwitterSource','text', 1);
insert into general_config values ('Source_Type','org.apache.flume.source.kafka.KafkaSource','Kafka','Source is an Apache Kafka consumer that reads messages from a Kafka topic', 0,'org.apache.flume.source.kafka.KafkaSource','text', 1);
insert into general_config values ('Source_Type','netcat','NetCat','Source that listens on a given port and turns each line of text into an event', 0,'netcat','text', 1);
insert into general_config values ('Source_Type','seq','Sequence Generator','Source continuously generates events with a counter that starts from 0 and increments by 1', 0,'seq','text', 1);
insert into general_config values ('Source_Type','syslogtcp','Syslog TCP','Syslog TCP source', 0,'syslogtcp','text', 1);
insert into general_config values ('Source_Type','multiport_syslogtcp','Multiport Syslog TCP','Multi-port capable version of the Syslog TCP source', 0,'multiport_syslogtcp','text', 1);
insert into general_config values ('Source_Type','syslogudp','Syslog UDP','Syslog UDP source', 0,'syslogudp','text', 1);
insert into general_config values ('Source_Type','http','HTTP','Accepts Flume Events by HTTP POST and GET', 0,'http','text', 1);
insert into general_config values ('Source_Type','org.apache.flume.source.StressSource','Stress','StressSource is an internal load-generating source implementation which is very useful for stress tests', 0,'org.apache.flume.source.StressSource','text', 1);
insert into general_config values ('Source_Type','org.apache.flume.source.avroLegacy.AvroLegacySource','Legacy','Legacy sources allow a Flume 1.x agent to receive events from Flume 0.9.4 agents', 0,'org.apache.flume.source.avroLegacy.AvroLegacySource','text', 1);
insert into general_config values ('Source_Type','org.apache.flume.source.thriftLegacy.ThriftLegacySource','Thrift Legacy','Thrift Legacy', 0,'org.apache.flume.source.thriftLegacy.ThriftLegacySource','text', 1);
insert into general_config values ('Source_Type','org.apache.flume.source.scribe.ScribeSource','Scribe','Scribe is another type of ingest system', 0,'org.apache.flume.source.scribe.ScribeSource','text', 1);

-- Properties associated with Avro Source

insert into general_config values ('avro_Source','bind','Bind','hostname or IP address to listen on',1,'localhost','text', 1);
insert into general_config values ('avro_Source','port','Port','Port -- to bind to',1,'8080','text', 1);
insert into general_config values ('avro_Source','threads','Threads','Maximum number of worker threads to spawn', 0,null,'text', 1);
insert into general_config values ('avro_Source','selector.type','Selector Type','Defines selector type', 0,null,'text', 1);
insert into general_config values ('avro_Source','selector.*','Selector.*','Selectors', 0,null,'text', 1);
insert into general_config values ('avro_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values ('avro_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);
insert into general_config values ('avro_Source','compression-type','Compression-type','This can be “none” or “deflate”. The compression-type must match the compression-type of matching AvroSource', 0,'none','text', 1);
insert into general_config values ('avro_Source','ssl','SSL','Set this to  1 to enable SSL encryption. You must also specify a “keystore” and a “keystore-password”.', 0,'false','text', 1);
insert into general_config values ('avro_Source','keystore','Keystore','This is the path to a Java keystore file. Required for SSL.', 0,null,'text', 1);
insert into general_config values ('avro_Source','keystore-password','Keystore Password','The password for the Java keystore. Required for SSL.', 0,null,'text', 1);
insert into general_config values ('avro_Source','keystore-type','Keystore Type','The type of the Java keystore. This can be “JKS” or “PKCS12”.', 0,'JKS','text', 1);
insert into general_config values ('avro_Source','exclude-protocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 will always be excluded in addition to the protocols specified.', 0,'SSLv3','text', 1);
insert into general_config values ('avro_Source','ipFilter','IP Filter','Set this to  1 to enable ipFiltering for netty', 0,'false','text', 1);
insert into general_config values ('avro_Source','ipFilterRules','IP Filter Rules','Define N netty ipFilter pattern rules with this config.', 0,null,'text', 1);

-- Properties associated with Thrift Source

insert into general_config values ('thrift_Source','bind','Bind','hostname or IP address to listen on',1,'localhost','text', 1);
insert into general_config values ('thrift_Source','port','Port','Port -- to bind to',1,'8080','text', 1);
insert into general_config values ('thrift_Source','threads','Threads','Maximum number of worker threads to spawn', 0,null,'text', 1);
insert into general_config values ('thrift_Source','Selector Type','selector.type','Selector Type', 0,null,'text', 1);
insert into general_config values ('thrift_Source','selector.*','Selector.*','Selectors', 0,null,'text', 1);
insert into general_config values ('thrift_Source','interceptors','Interceptors','Space separated list of interceptors', 0,null,'text', 1);
insert into general_config values ('thrift_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);
insert into general_config values ('thrift_Source','ssl','SSL','Set this to  1 to enable SSL encryption. You must also specify a “keystore” and a “keystore-password”.', 0,'false','text', 1);
insert into general_config values ('thrift_Source','keystore','Keystore','This is the path to a Java keystore file. Required for SSL.', 0,null,'text', 1);
insert into general_config values ('thrift_Source','keystore-password','Keystore Password','The password for the Java keystore. Required for SSL.', 0,null,'text', 1);
insert into general_config values ('thrift_Source','keystore-type','keystore Type','The type of the Java keystore. This can be “JKS” or “PKCS12”.', 0,'JKS','text', 1);
insert into general_config values ('thrift_Source','exclude-protocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 will always be excluded in addition to the protocols specified.', 0,'SSLv3','text', 1);
insert into general_config values ('thrift_Source','kerberos','Kerberos','Set to  1 to enable kerberos authentication. In kerberos mode, agent-principal and agent-keytab are required for successful authentication. The Thrift source in secure mode, will accept connections only from Thrift clients that have kerberos enabled and are successfully authenticated to the kerberos KDC.', 0,'false','text', 1);
insert into general_config values ('thrift_Source','agent-principal','Agent Principal','The kerberos principal used by the Thrift Source to authenticate to the kerberos KDC.', 0,null,'text', 1);
insert into general_config values ('thrift_Source','agent-keytab','Agent Keytab','The keytab location used by the Thrift Source in combination with the agent-principal to authenticate to the kerberos KDC.', 0,null,'text', 1);

-- Properties associated with Exec Source

insert into general_config values ('exec_Source','command','Command','The command to execute',1,'cat /home/bdreusr/flume/flume-test.txt','text', 1);
insert into general_config values ('exec_Source','shell','Shell','A shell invocation used to run the command. e.g. /bin/sh -c. Required only for commands relying on shell features like wildcards, back ticks, pipes etc.', 0,null,'text', 1);
insert into general_config values ('exec_Source','restartThrottle','Restart Throttle','Amount of time (in millis) to wait before attempting a restart', 0,'10000','text', 1);
insert into general_config values ('exec_Source','restart','Restart','Whether the executed cmd should be restarted if it dies', 0,'false','text', 1);
insert into general_config values ('exec_Source','logStdErr','Logstderr','Whether the command is stderr should be logged', 0,'false','text', 1);
insert into general_config values ('exec_Source','batchSize','Batchsize','The max number of lines to read and send to the channel at a time', 0,'20','text', 1);
insert into general_config values ('exec_Source','batchTimeout','Batchtimeout','Amount of time (in milliseconds) to wait, if the buffer size was not reached, before data is pushed downstream', 0,'3000','text', 1);
insert into general_config values ('exec_Source','selector.type','Selector.Type','replicating or multiplexing', 0,'replicating','text', 1);
insert into general_config values ('exec_Source','selector.*','Selector.*','Depends on the selector.type value', 0,null,'text', 1);
insert into general_config values ('exec_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values ('exec_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);

-- Properties associated with JMS Source

insert into general_config values ('jms_Source','initialContextFactory','Initial Context Factory','Inital Context Factory, e.g: org.apache.activemq.jndi.ActiveMQInitialContextFactory',1,'org.apache.activemq.jndi.ActiveMQInitialContextFactory','text', 1);
insert into general_config values ('jms_Source','connectionFactory','Connection Factory','The JNDI name the connection factory should appear as',1,'MQ','text', 1);
insert into general_config values ('jms_Source','providerURL','Provider URL','The JMS provider URL',1,'http://localhost:8080','text', 1);
insert into general_config values ('jms_Source','destinationName','Destination Name','Destination name',1,'hdfs','text', 1);
insert into general_config values ('jms_Source','destinationType','Destination Type','Destination type (queue or topic)',1,'queue','text', 1);
insert into general_config values ('jms_Source','messageSelector','Message Selector','Message selector to use when creating the consumer', 0,null,'text', 1);
insert into general_config values ('jms_Source','userName','Username','User Name for the destination/provider', 0,null,'text', 1);
insert into general_config values ('jms_Source','passwordFile','Password File','File containing the password for the destination/provider', 0,null,'text', 1);
insert into general_config values ('jms_Source','batchSize','Batch Size','Number of messages to consume in one batch', 0,'100','text', 1);
insert into general_config values ('jms_Source','converter.type','Converter Type','Class to use to convert messages to flume events. See below.', 0,null,'text', 1);
insert into general_config values ('jms_Source','converter.*','Converter.*','Converter properties.', 0,null,'text', 1);
insert into general_config values ('jms_Source','converter.charset','Converter Charset','Default converter only. Charset to use when converting JMS TextMessages to byte arrays.', 0,null,'text', 1);

-- Properties associated with Spool Directory Source

insert into general_config values('spooldir_Source','spoolDir','Spool Dir','The directory from which to read files from.',1,'/home/bdreusr/flume','text', 1);
insert into general_config values('spooldir_Source','fileSuffix','File Suffix','Suffix to append to completely ingested files', 0,'.COMPLETED','text', 1);
insert into general_config values('spooldir_Source','deletePolicy','Delete Policy','When to delete completed files: never or immediate', 0,'never','text', 1);
insert into general_config values('spooldir_Source','fileHeader','File Header','Whether to add a header storing the absolute path filename.', 0,'false','text', 1);
insert into general_config values('spooldir_Source','fileHeaderKey','File Header Key','Header key to use when appending absolute path filename to event header.', 0,'file','text', 1);
insert into general_config values('spooldir_Source','basenameHeader','Basename Header','Whether to add a header storing the basename of the file.', 0,'false','text', 1);
insert into general_config values('spooldir_Source','basenameHeaderKey','Basename Headerkey','Header Key to use when appending basename of file to event header.', 0,'basename','text', 1);
insert into general_config values('spooldir_Source','ignorePattern','Ignore Pattern','Regular expression specifying which files to ignore (skip)', 0,'^$','text', 1);
insert into general_config values('spooldir_Source','trackerDir','Tracker Dir','Directory to store metadata related to processing of files. If this path is not an absolute path, then it is interpreted as relative to the spoolDir.', 0,'.flumespool','text', 1);

insert into general_config values('spooldir_Source','consumeOrder','Consume Order','In which order files in the spooling directory will be consumed oldest, youngest and random. In case of oldest andyoungest, the last modified time of the files will be used to compare the files. In case of a tie, the file with smallest laxicographical order will be consumed first. In case of random any file will be picked randomly. When using oldest andyoungest the whole directory will be scanned to pick the oldest/youngest file, which might be slow if there are a large number of files, while using random may cause old files to be consumed very late if new files keep coming in the spooling directory.', 0,'oldest','text', 1);

insert into general_config values('spooldir_Source','maxBackoff','Max Backoff','The maximum time (in millis) to wait between consecutive attempts to write to the channel(s) if the channel is full. The source will start at a low backoff and increase it exponentially each time the channel throws a ChannelException, upto the value specified by this parameter.', 0,'4000','text', 1);

insert into general_config values('spooldir_Source','batchSize','Batch Size','Granularity at which to batch transfer to the channel', 0,'100','text', 1);
insert into general_config values('spooldir_Source','inputCharset','Input Charset','Character set used by deserializers that treat the input file as text.', 0,'UTF-8','text', 1);
insert into general_config values('spooldir_Source','decodeErrorPolicy','Decode Error Policy','What to do when we see a non-decodable character in the input file. FAIL: Throw an exception and fail to parse the file.REPLACE: Replace the unparseable character with the “replacement character” char, typically Unicode U+FFFD. IGNORE: Drop the unparseable character sequence.', 0,'FAIL','text', 1);
insert into general_config values('spooldir_Source','deserializer','Deserializer','Specify the deserializer used to parse the file into events. Defaults to parsing each line as an event. The class specified must implement EventDeserializer.Builder.', 0,'LINE','text', 1);
insert into general_config values('spooldir_Source','deserializer.*','Deserializer.*','Varies per event deserializer.', 0,null,'text', 1);
insert into general_config values('spooldir_Source','bufferMaxLines','Buffer Max Lines','(Obselete) This option is now ignored.', 0,null,'text', 1);
insert into general_config values('spooldir_Source','bufferMaxLineLength','Buffermax Line Length','(Deprecated) Maximum length of a line in the commit buffer. Use deserializer.maxLineLength instead.', 0,'5000','text', 1);
insert into general_config values('spooldir_Source','selector.type','Selector Type','replicating or multiplexing', 0,'replicating','text', 1);
insert into general_config values('spooldir_Source','selector.*','Selector.*','Depends on the selector.type value', 0,null,'text', 1);
insert into general_config values('spooldir_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('spooldir_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);

-- Properties associated with twitter Source

insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','consumerKey','Consumerkey','OAuth consumer key', 1,'your key','text', 1);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','consumerSecret','Consumersecret','OAuth consumer secret', 1,'your secret','text', 1);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','accessToken','Accesstoken','OAuth access token', 1,'your access token','text', 1);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','accessTokenSecret','Accesstokensecret','OAuth toekn secret', 1,'your acces secret','text', 1);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','keywords','HASHTAGS','keywords based on which you want filter your tweets', 1,'#BigData','text', 1);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','maxBatchSize','Maxbatchsize','Maximum number of twitter messages to put in a single batch', 0,'1000','text', 1);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','maxBatchDurationMillis','Maxbatchdurationmillis','Maximum number of milliseconds to wait before closing a batch', 0,'1000','text', 1);

-- Properties associated with twitter BDRE Source

insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','consumerKey','Consumerkey','OAuth consumer key', 1,'your key','text', 1);
insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','consumerSecret','Consumersecret','OAuth consumer secret', 1,'your secret','text', 1);
insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','accessToken','Accesstoken','OAuth access token', 1,'your access token','text', 1);
insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','accessTokenSecret','Accesstokensecret','OAuth toekn secret', 1,'your acces secret','text', 1);
insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','keywords','HASHTAGS','keywords based on which you want filter your tweets', 1,'#BigData','text', 1);
insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','maxBatchSize','Maxbatchsize','Maximum number of twitter messages to put in a single batch', 0,'1000','text', 1);
insert into general_config values('com.cloudera.flume.source.TwitterSource_Source','maxBatchDurationMillis','Maxbatchdurationmillis','Maximum number of milliseconds to wait before closing a batch', 0,'1000','text', 1);

-- Properties associated with Kafka Source

insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','zookeeperConnect','Zookeeper Connect','URI of ZooKeeper used by Kafka cluster', 1,null,'text', 1);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','groupId','Group Id','Unique identified of consumer group. Setting the same id in multiple sources or agents indicates that they are part of the same consumer group',1,'flume','text', 1);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','topic','Topic','Kafka topic we will read messages from. At the time, this is a single topic only.', 1,null,'text', 1);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','batchSize','Batch Size','Maximum number of messages written to Channel in one batch', 0,'1000','text', 1);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','batchDurationMillis','Batch Duration Millis','Maximum time (in ms) before a batch will be written to Channel The batch will be written whenever the first of size and time will be reached.', 0,'1000','text', 1);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','backoffSleepIncrement','Backoff Sleep Increment','Initial and incremental wait time that is triggered when a Kafka Topic appears to be empty. Wait period will reduce aggressive pinging of an empty Kafka Topic. One second is ideal for ingestion use cases but a lower value may be required for low latency operations with interceptors.', 0,'1000','text', 1);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','maxBackoffSleep','Max Backoff Sleep','Maximum wait time that is triggered when a Kafka Topic appears to be empty. Five seconds is ideal for ingestion use cases but a lower value may be required for low latency operations with interceptors.', 0,'5000','text', 1);

-- Properties associated with Netcat Source

insert into general_config values('netCat_Source','bind','Bind','Host name or IP address to bind to',1,'localhost','text', 1);
insert into general_config values('netCat_Source','port','Port','Port -- to bind to',1,'8080','text', 1);
insert into general_config values('netCat_Source','max-line-length','Max Line Length','Max line length per event body (in bytes)', 0,'512','text', 1);
insert into general_config values('netCat_Source','ack-every-event','Ack Every Event','Respond with an “OK” for every event received', 0,'true','text', 1);
insert into general_config values('netCat_Source','selector.type','Selector Type','replicating or multiplexing', 0,'replicating','text', 1);
insert into general_config values('netCat_Source','selector.*','Selector.*','Depends on the selector.type value', 0,null,'text', 1);
insert into general_config values('netCat_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('netCat_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);

-- Properties associated with sequence generator Source

insert into general_config values('seq_Source','selector.type','Selector Type','replicating or multiplexing', 0,null,'text', 1);
insert into general_config values('seq_Source','selector.*','Selector.*','Depends on the selector.type value', 0,'replicating','text', 1);
insert into general_config values('seq_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('seq_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);
insert into general_config values('seq_Source','batchSize','Batch Size','Batch Size', 0,'1','text', 1);

-- Properties associated with Syslog_TCP Source

insert into general_config values('syslogtcp_Source','host','Host','Host name or IP address to bind to',1,'localhost','text', 1);
insert into general_config values('syslogtcp_Source','port','Port','Port -- to bind to',1,'8080','text', 1);
insert into general_config values('syslogtcp_Source','eventSize','EventSize','Maximum size of a single event line, in bytes', 0,'2500','text', 1);
insert into general_config values('syslogtcp_Source','keepFields','Keep Fields','Setting this to "all" will preserve the Priority, Timestamp and Hostname in the body of the event. A spaced separated list of fields to include is allowed as well. Currently, the following fields can be included: priority, version, timestamp, hostname. The values " 1" and " 0" have been deprecated in favor of "all" and "none".', 0,'none','text', 1);
insert into general_config values('syslogtcp_Source','selector.type','Selector Type','replicating or multiplexing', 0,null,'text', 1);
insert into general_config values('syslogtcp_Source','selector.*','Selector.*','Depends on the selector.type value', 0,'replicating','text', 1);
insert into general_config values('syslogtcp_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('syslogtcp_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);

-- Properties associated with Multiport Syslog_TCP Source

insert into general_config values('multiport_syslogtcp_Source','host','Host','Host name or IP address to bind to.',1,'localhost','text', 1);
insert into general_config values('multiport_syslogtcp_Source','ports','Ports','Space-separated list (one or more) of ports to bind to.',1,'8080 8020','text', 1);
insert into general_config values('multiport_syslogtcp_Source','eventSize','Event Size','Maximum size of a single event line, in bytes.', 0,'2500','text', 1);
insert into general_config values('multiport_syslogtcp_Source','keepFields','Keep Fields','Setting this to "all" will preserve the Priority, Timestamp and Hostname in the body of the event. A spaced separated list of fields to include is allowed as well. Currently, the following fields can be included: priority, version, timestamp, hostname. The values " 1" and " 0" have been deprecated in favor of "all" and "none".', 0,'none','text', 1);
insert into general_config values('multiport_syslogtcp_Source','portHeader','Port Header','If specified, the port number will be stored in the header of each event using the header name specified here. This allows for interceptors and channel selectors to customize routing logic based on the incoming port.', 0,null,'text', 1);
insert into general_config values('multiport_syslogtcp_Source','charset.default','Charset Default','Default character set used while parsing syslog events into strings.', 0,'UTF-8','text', 1);
insert into general_config values('multiport_syslogtcp_Source','charset.port.<port>','Charset Port <port>','Character set is configurable on a per-port basis.', 0,null,'text', 1);
insert into general_config values('multiport_syslogtcp_Source','batchSize','Batch Size','Maximum number of events to attempt to process per request loop. Using the default is usually fine.', 0,'100','text', 1);
insert into general_config values('multiport_syslogtcp_Source','readBufferSize','Read Buffer Size','Size of the internal Mina read buffer. Provided for performance tuning. Using the default is usually fine.', 0,'1024','text', 1);
insert into general_config values('multiport_syslogtcp_Source','numProcessors','Num Processors','Number of processors available on the system for use while processing messages. Default is to auto-detect -- of CPUs using the Java Runtime API. Mina will spawn 2 request-processing threads per detected CPU, which is often reasonable.', 0,'(auto-detected)','text', 1);
insert into general_config values('multiport_syslogtcp_Source','selector.type','Selector.type','replicating, multiplexing, or custom', 0,'replicating','text', 1);
insert into general_config values('multiport_syslogtcp_Source','selector.*','Selector.*','Depends on the selector.type value', 0,null,'text', 1);
insert into general_config values('multiport_syslogtcp_Source','interceptors','Interceptors','Space-separated list of interceptors.', 0,null,'text', 1);
insert into general_config values('multiport_syslogtcp_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);

-- Properties associated with Syslog UDP Source

insert into general_config values('syslogudp_Source','host','Host','Host name or IP address to bind to',1,'localhost','text', 1);
insert into general_config values('syslogudp_Source','port','Port','Port -- to bind to',1,'8080','text', 1);
insert into general_config values('syslogudp_Source','keepFields','Keep Fields','Setting this to  1 will preserve the Priority, Timestamp and Hostname in the body of the event.', 0,'false','text', 1);
insert into general_config values('syslogudp_Source','selector.type','Selector.type','replicating or multiplexing', 0,null,'text', 1);
insert into general_config values('syslogudp_Source','selector.*','Selector.*','Depends on the selector.type value', 0,'replicating','text', 1);
insert into general_config values('syslogudp_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('syslogudp_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);



-- Properties associated with http Source

insert into general_config values('http_Source','port','Port','The port the source should bind to.',1,'8080','text', 1);
insert into general_config values('http_Source','bind','Bind','The hostname or IP address to listen on', 0,'0.0.0.0','text', 1);
insert into general_config values('http_Source','handler','Handler','The FQCN of the handler class.', 0,'org.apache.flume.source.http.JSONHandler','text', 1);
insert into general_config values('http_Source','handler.*','Handler.*','Config parameters for the handler', 0,null,'text', 1);
insert into general_config values('http_Source','selector.type','Selector Type','replicating or multiplexing', 0,'replicating','text', 1);
insert into general_config values('http_Source','selector.*','Selector.*','Depends on the selector.type value', 0,null,'text', 1);
insert into general_config values('http_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('http_Source','interceptors.*','Interceptors.*','Interceptors', 0,null,'text', 1);
insert into general_config values('http_Source','enableSSL','Enable SSL','Set the property  1, to enable SSL. HTTP Source does not support SSLv3.', 0,'false','text', 1);
insert into general_config values('http_Source','excludeProtocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 is always excluded.', 0,'SSLv3','text', 1);
insert into general_config values('http_Source','keystore','Key store','Location of the keystore includng keystore file name', 0,null,'text', 1);
insert into general_config values('http_Source','keystorePassword','Keystore password','Keystore password', 0,'Keystore password','text', 1);


-- Properties associated with Stress Source

insert into general_config values('org.apache.flume.source.StressSource_Source','size','Size','Payload size of each Event. Unit:byte', 0,'500','text', 1);
insert into general_config values('org.apache.flume.source.StressSource_Source','maxTotalEvents','Max Total Events','Maximum number of Events to be sent', 0,'-1','text', 1);
insert into general_config values('org.apache.flume.source.StressSource_Source','maxSuccessfulEvents','Max Successful Events','Maximum number of Events successfully sent', 0,'-1','text', 1);
insert into general_config values('org.apache.flume.source.StressSource_Source','batchSize','Batch Size','Number of Events to be sent in one batch', 0,'1','text', 1);

-- Properties associated with avro legacy Source

insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','host','Host','The hostname or IP address to bind to',1,'localhost','text', 1);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','port','Port','The port -- to listen on',1,'8080','text', 1);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','selector.type','Selector Type','replicating or multiplexing', 0,null,'text', 1);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','selector.*','Selector.*','Depends on the selector.type value', 0,'replicating','text', 1);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','interceptors.*','interceptors.*','Interceptors', 0,null,'text', 1);

-- Properties associated with thrift legacy Source

insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','host','Host','The hostname or IP address to bind to',1,'localhost','text', 1);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','port','Port','The port -- to listen on',1,'8080','text', 1);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','selector.type','Selector Type','replicating or multiplexing', 0,null,'text', 1);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','selector.*','Selector.*','Depends on the selector.type value', 0,'replicating','text', 1);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','interceptors','Interceptors','Space-separated list of interceptors', 0,null,'text', 1);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','interceptors.*','interceptors.*','Interceptors', 0,null,'text', 1);



-- Properties associated with scribe Source

insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','port','Port','Port that Scribe should be connected', 0,'1499','text', 1);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','maxReadBufferBytes','Max Read Buffer Bytes','Thrift Default FrameBuffer Size', 0,'16384000','text', 1);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','workerThreads','Worker Threads','Handing threads number in Thrift', 0,'5','text', 1);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','selector.type','Selector.type','Selector Type', 0,null,'text', 1);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','selector.*','Selector.*','Selectors', 0,null,'text', 1);

-- Properties for md-config.xml file

INSERT INTO general_config VALUES ('mdconfig', 'status-notification.initial-context-factory', 'Active MQ Initial Context Factory', 'MQ notification factory for status notification',  1, 'org.apache.activemq.jndi.ActiveMQInitialContextFactory', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'status-notification.provider-url', 'Notification Provider URL', 'MQ server address for status notification',  1, 'tcp://localhost:61616', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'status-notification.halt-queue', 'Halt Queue', 'Halt Queue info for status notification',  1, 'Success', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'status-notification.term-queue', 'Term Queue', 'Term Queue info for status notification',  1, 'Failure', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'deploy.script-path', 'Deployment script path', 'Deployment script path',  1, 'BDRE/jack/installer/guestfiles/deploy/process-type-', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'execute.log-path', 'Log File Location', 'Path for log file',  1, '/var/log/BDRE/logfile-', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'execute.oozie-script-path', 'Oozie Script Path', 'Oozie workflow script path',  1, '/home/cloudera/Workflow.py', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'execute.standalone-script-path', 'Flume Script Path', 'Flume script path for standalone purpose',  1, '/home/cloudera/flume.sh', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'execute.rest-exec-url', 'Execute URL', 'URL where your execute jetty server is running',  1, 'http://localhost:7777/execute/', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'upload.base-directory', 'Base Directory For Upload', 'Base Directory where you want to upload jars and hqls',  1, 'target', 'text', 1);
INSERT INTO general_config VALUES ('mdconfig', 'r.shell-script', 'Location of R shell script', 'Location of R shell script', '1', '/tmp/Rhadoop.sh', 'text', '1');

-- Properties for im-config.xml file

INSERT INTO  general_config  VALUES ('imconfig', 'common.default-fs-name', 'Default file system name','Default file system name', 1, 'hdfs://localhost:8020', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.hive-connection', 'URL of Hive connection','URL of Hive connection', 1, 'jdbc:hive2://localhost:10000', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.hdfs-raw-directory', 'Hadoop raw directory','Hadoop raw directory' , 1, '/raw', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.hive-metastore-uris', 'URL of Hive metastore','URL of Hive metastore', 1, 'thrift://localhost:9083', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.local-download-directory', 'Directory to store downloaded files','Directory to store downloaded files', 1, '/home/user/Downloads', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.thread-wait', 'Thread waiting time','Thread waiting time', 1, '500', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.dirs', 'Monitoring files directory list','Monitoring files directory list', 1, '/home/cloudera/oozies,/home/cloudera/datasets', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.filter', 'Filter Information','Filter Information', 1, 'merchant\\s[0-9],test\\s[0-9]', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.sub-processIds', 'Sub process IDs','Sub process IDs', 1, '1,2', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.serverIds', 'Server IDs','Server IDs', 1, '100,200', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'dq.drools-url-prefix', 'URL prefix for drools','URL prefix for drools', 1, 'http://localhost:8080/guvnor56/rest/packages/', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'data-import.hadoop-home', 'Hadoop home directory for exporting','Hadoop home directory for exporting', 1, '/usr/lib/hadoop', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'data-import.target-dir', 'Target direcotry to store imported data','Target direcotry to store imported data', 1, 'hdfs://localhost:8020/user/dropuser/import', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'data-import.jar-output-dir', 'Jar output directory for importing','Jar output directory for importing', 1, '/home/cloudera/outputdir/jar-output', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'mq-import.file-size-units', 'File sizes unit','File sizes unit', 1, 'KB', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'mq-import.rotation-file-size', 'Rotation file size','Rotation file size', 1, '10', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'mq-import.target-directory', 'Directory to import MQ file','Directory to import MQ file', 1, 'hdfs://localhost:8020/user/dropuser/mq-import', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'data-export.hadoop-home', 'Hadoop home directory for exporting','Hadoop home directory for exporting', 1, '/usr/lib/hadoop', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'data-export.jar-output-dir', 'Jar output directory for exporting','Jar output directory for exporting', 1, '/home/cloudera/outputdir/jar-output', 'text', 1);
INSERT INTO  general_config  VALUES ('imconfig', 'eventing.metadata-broker-list', 'Metadata Brokers URL','Metadata Brokers URL', 1, 'localhost://:9092', 'text', 1);

-- Populating crawler process
insert into general_config values ('crawler','numberOfMappers','no of mappers','Number of Mappers',1,'2','text', 1);
insert into general_config values ('crawler','politenessDelay','Politeness Delay','Politeness Delay',1,'200','text', 1);
insert into general_config values ('crawler','maxDepthOfCrawling','max depth of crawling','Max Depth of Crawling',1,'10','text', 1);
insert into general_config values ('crawler','maxPagesToFetch','max pages to fetch','Max Pages to Fetch',1,'5','text', 1);
insert into general_config values ('crawler','includeBinaryContentInCrawling','binary content in crawling','To Include binary content in crawling', 1, 0,'text', 1);
insert into general_config values ('crawler','resumableCrawling','Resumable crawling','Resumable crawling', 1, 0,'text', 1);
insert into general_config values ('crawler','userAgentString','user agent string','User Agent String',1,'Mozilla/123.0 (Windows NT 6.1) AppleWebKit/12337.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/12337.36','text', 1);
insert into general_config values ('crawler','proxyHost','proxy host','Proxy Host',1,'null','text', 1);
insert into general_config values ('crawler','proxyPort','proxy port','Proxy Port',1,'null','text', 1);
insert into general_config values ('crawler','proxyUsername','Proxy Username','proxy username',1,'null','text', 1);
insert into general_config values ('crawler','proxyPassword','Proxy Password','proxy password',1,'null','text', 1);
insert into general_config values ('crawler','url','url','urls to crawl',1,'https://www.dmoz.org,https://www.zomato.com/mumbai','text', 1);
insert into general_config values ('crawler','urlsToSearch','urls to search','urls to search',1,'.*','text', 1);
insert into general_config values ('crawler','urlsNotToSearch','urls not to search','urls not to search',1,'.*\\\\.(bmp|gif|jpg|png)$','text', 1);





--populating general_config for post-gres

insert into general_config values('1','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);	-- Ingestion

insert into general_config values('2','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);	-- Semantic

insert into general_config values('3','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);	-- Export

insert into general_config values('4','credential','CredentialConfiguration','Credentials for authentication',true,'true|false','option',true);	-- Data Extraction

insert into general_config values('5','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);	-- Hive Data Load

-- insert into general_config values('6','','','',true,'TRUE','text',true);	-- Raw Load

-- insert into general_config values('7','','','',true,'TRUE','text',true);	-- Stage Load

-- insert into general_config values('8','','','',true,'TRUE','text',true);	-- Base Load

-- Hive Action
insert into general_config values('9','param','Parameters','Additional parameters',true,'TRUE','text',true);
insert into general_config values('9','query','Query file location','Query file location',true,'TRUE','file',true);

-- Pig Action
insert into general_config values('10','param','Parameters','Additional parameters',true,'TRUE','text',true);
insert into general_config values('10','script','Script location','Script location',true,'TRUE','file',true);

-- Map Reduce
insert into general_config values('11','param','Parameters','Additional parameters',true,'TRUE','text',true);

insert into general_config values('11','program','Program Main Class','Program main class',true,'TRUE','text',true);


-- SFTP
-- insert into general_config values('12','','','',true,'TRUE','text',true);

-- RDBMS import step
insert into general_config values('13','imp-common','Import Configuration','RDBMS Import Configuration',true,'TRUE','text',true);

-- Test Data generation step
insert into general_config values('14','data','Data-generate Configuration','',true,'TRUE','text',true);
insert into general_config values('14','table','table Schema Configuration','',true,'TRUE','text',true);

-- File Registration
insert into general_config values('15','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);

-- DQ step
insert into general_config values('16','dq','DQ Configuration','Data Quality configuration',true,'TRUE','text',true);

-- Export Step
insert into general_config values('17','exp-common','Export Configuration','RDBMS Export Configuration',true,'TRUE','text',true);

-- Hive Generation_Parent
insert into general_config values('18','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);


-- DQ_Parent
insert into general_config values('19','credential','Credential Configuration','Credentials for authentication',true,'true|false','option',true);

-- MQ_Parent
insert into general_config values('20','credential','CredentialConfiguration','Credentials for authentication',true,'true|false','option',true);

-- MQ Step
insert into general_config values('21','mqimport','MQ Import Configuration','Messaging Queue import configuration',true,'TRUE','text',true);

-- Shell Action
insert into general_config values('22','param','Parameters','Additional parameters',true,'TRUE','text',true);
insert into general_config values('22','script','Script location','',true,'TRUE','file',true);

-- Flume Action
insert into general_config values('23','flume','Flume Configuration','Flume',true,'TRUE','text',true);

-- R Action
insert into general_config values ('24', 'param', 'Parameters', 'Parameters', '1', 'TRUE', 'text', '1');
insert into general_config values ('24', 'r-file', 'R file', 'R code', '1', 'TRUE', 'r', '1');

-- Spark Action
insert into general_config values ('25', 'spark-conf', 'Spark Job Configuration', 'Spark Job Configuration', '1', 'TRUE', 'text', '1');
insert into general_config values ('25', 'spark-main', 'Spark Main Class', 'Spark Main Class', '1', 'TRUE', 'text', '1');
insert into general_config values ('25', 'app-args', 'Application arguments', 'Application arguments', '1', 'TRUE', 'text', '1');
insert into general_config values ('25', 'spark-jar', 'Spark jar', 'Spark Application jar', '1', 'TRUE', 'spark', '1');

-- Populating general config for default insert properties

 -- File Registration
insert into general_config values('default_val.15','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);

insert into general_config values('default_val.5','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);	-- Hive Data Load

-- insert into general_config values('default_val.6','','','',true,'TRUE','text',true);	-- Raw Load

-- insert into general_config values('default_val.7','','','',true,'TRUE','text',true);	-- Stage Load

-- insert into general_config values('default_val.8','','','',true,'TRUE','text',true);	-- Base Load

insert into general_config values('default_val.2','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);	-- Semantic

-- Hive Action
-- Pig Action
-- Shell Action

-- Map Reduce

insert into general_config values('default_val.11','mainClass','program','Program file location',true,'','text',true);

-- SFTP
-- insert into general_config values('default_val.12','','','',true,'TRUE','text',true);


insert into general_config values('default_val.4','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);	-- Data Extraction

-- RDBMS import step
insert into general_config values('default_val.13','check.col','imp-common','properties for data import',true,'default_column','text',true);
insert into general_config values('default_val.13','columns','imp-common','properties for data import',true,'default_cols','text',true);
insert into general_config values('default_val.13','db','imp-common','properties for data import',true,'default_db','text',true);
insert into general_config values('default_val.13','driver','imp-common','properties for data import',true,'com.mysql.jdbc.Driver','text',true);
insert into general_config values('default_val.13','file.layout','imp-common','properties for data import',true,'TextFile','text',true);
insert into general_config values('default_val.13','import','imp-common','properties for data import',true,'1','text',true);
insert into general_config values('default_val.13','incr.mode','imp-common','properties for data import',true,'None','text',true);
insert into general_config values('default_val.13','mappers','imp-common','properties for data import',true,'1','text',true);
insert into general_config values('default_val.13','password','imp-common','properties for data import',true,'db_password','text',true);
insert into general_config values('default_val.13','table','imp-common','properties for data import',true,'default_table','text',true);
insert into general_config values('default_val.13','username','imp-common','properties for data import',true,'db_username','text',true);

insert into general_config values('default_val.3','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);	-- Export

-- Export Step
insert into general_config values('default_val.17','db','exp-common','properties for data export',true,'default_db','text',true);
insert into general_config values('default_val.17','driver','exp-common','properties for data export',true,'com.mysql.jdbc.Driver','text',true);
insert into general_config values('default_val.17','table','exp-common','properties for data export',true,'default_table','text',true);
insert into general_config values('default_val.17','mappers','exp-common','properties for data export',true,'1','text',true);
insert into general_config values('default_val.17','password','exp-common','properties for data export',true,'db_password','text',true);
insert into general_config values('default_val.17','username','exp-common','properties for data export',true,'db_username','text',true);

-- Hive Generation_Parent
insert into general_config values('default_val.18','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);

-- Test Data generation step
insert into general_config values('testDataGen','data-gen-id.1','data','Generating Date',true,'randomDate','text',true);
insert into general_config values('testDataGen','data-gen-id.2','data','Generating number',true,'randomNumber','text',true);
insert into general_config values('testDataGen','data-gen-id.3','data','Generating String',true,'randomRegexPattern','text',true);


-- DQ_Parent
insert into general_config values('default_val.19','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);

-- DQ step
insert into general_config values('default_val.16','file.delimiter.regex','dq','File delimiter',true,',','text',true);
insert into general_config values('default_val.16','min.pass.threshold.percent','dq','Min pass threshold percentage',true,'90','text',true);
insert into general_config values('default_val.16','rules.package','dq','rules package',true,'com.wipro.ats.bdre.bank','text',true);
insert into general_config values('default_val.16','rules.password','dq','rules password',true,'def_password','text',true);
insert into general_config values('default_val.16','rules.username','dq','rules user name',true,'default_user','text',true);

-- MQ_Parent
insert into general_config values('default_val.20','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);

-- MQ Step
insert into general_config values('default_val.21','broker.url','mqimport','Broker URL of Active MQ',true,'tcp://localhost:61616','text',true);
insert into general_config values('default_val.21','num.bolts','mqimport','Number of bolts/parallel message processors',true,'1','text',true);
insert into general_config values('default_val.21','num.spouts','mqimport','Number of spouts/parallel message consumer',true,'1','text',true);
insert into general_config values('default_val.21','queue.name','mqimport','Name of the Queue of ActiveMQ',true,'default_QueueName','text',true);


insert into general_config values('default_val.1','password_enabled','credential','Credentials for authentication',true,'TRUE','text',true);	-- Ingestion

-- Flume general configurations

# Types of Sink Type Supported in flume
insert into general_config values ('Sink_Type','hdfs','HDFS','Data will be stored in hdfs',false,'hdfs','text',true);
insert into general_config values ('Sink_Type','hive','HIVE','Data will be stored in hive',false,'hive','text',true);
insert into general_config values ('Sink_Type','logger','Logger','Sink is used for testing and debuggin purpose',false,'logger','text',true);
insert into general_config values ('Sink_Type','avro','Avro',' Flume events sent to this sink are turned into Avro events and sent to the configured hostname / port pair.',false,'avro','text',true);
insert into general_config values ('Sink_Type','thrift','Thrift','Flume events sent to this sink are turned into Thrift events and sent to the configured hostname / port pair',false,'thrift','text',true);
insert into general_config values ('Sink_Type','irc','IRC','The IRC sink takes messages from attached channel and relays those to configured IRC destinations',false,'irc','text',true);
insert into general_config values ('Sink_Type','file_roll','File Roll','Stores events on the local filesystem',false,'file_roll','text',true);
insert into general_config values ('Sink_Type','null','Null','Discards all events it receives from the channel',false,'null','text',true);
insert into general_config values ('Sink_Type','hbase','HBase','This sink writes data to HBase',false,'hbase','text',true);
insert into general_config values ('Sink_Type','asynchbase','Async HBase','This sink writes data to HBase using an asynchronous model',false,'asynchbase','text',true);
insert into general_config values ('Sink_Type','org.apache.flume.sink.solr.morphline.MorphlineSolrSink','Morphline Solr Sink','This sink extracts data from Flume events, transforms it, and loads it in near-real-time into Apache Solr servers, which in turn serve queries to end users or search applications',false,'org.apache.flume.sink.solr.morphline.MorphlineSolrSink','text',true);
insert into general_config values ('Sink_Type','org.apache.flume.sink.elasticsearch.ElasticSearchSink','Elastic Search Sink','This sink writes data to an elasticsearch cluster. By default, events will be written so that the Kibana graphical interface can display them - just as if logstash wrote them',false,'org.apache.flume.sink.elasticsearch.ElasticSearchSink','text',true);
insert into general_config values ('Sink_Type','org.apache.flume.sink.kite.DatasetSink','Dataset Sink','Experimental sink that writes events to a Kite Dataset. This sink will deserialize the body of each incoming event and store the resulting record in a Kite Dataset. It determines target Dataset by loading a dataset by URI',false,'org.apache.flume.sink.kite.DatasetSink','text',true);
insert into general_config values ('Sink_Type','org.apache.flume.sink.kafka.KafkaSink','Kafka Sink','This is a Flume Sink implementation that can publish data to a Kafka topic',false,'org.apache.flume.sink.kafka.KafkaSink','text',true);
insert into general_config values ('Sink_Type','FQCN','FQCN','A custom sink is your own implementation of the Sink interface. A custom sink’s class and its dependencies must be included in the agent’s classpath when starting the Flume agent.',false,'FQCN','text',true);

# Properties associated with hdfs sink

insert into general_config values ('hdfs_Sink','hdfs.path','HDFS Path','Path is HDFS where you want to put files',true,'/user/bdreusr/flume/%H','text',true);
insert into general_config values ('hdfs_Sink','hdfs.filePrefix','File Prefix','Name prefixed to files created by Flume in hdfs directory',false,'IngestedData','text',true);
insert into general_config values ('hdfs_Sink','hdfs.fileSuffix','File Suffix','Name suffixed to files created by Flume in hdfs directory',false,'%H%M%S','text',true);
insert into general_config values ('hdfs_Sink','hdfs.inUsePrefix','In Use Prefix','Prefix that is used for temporal files that flume actively writes into',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.inUseSuffix','In Use Suffix','Prefix that is used for temporal files that flume actively writes into',false,'.tmp','text',true);
insert into general_config values ('hdfs_Sink','hdfs.rollInterval','Roll Interval','Number of seconds to wait before rolling current file (0 = never roll based on time interval)',false,'0','text',true);
insert into general_config values ('hdfs_Sink','hdfs.rollSize','Roll Size','File size to trigger roll, in bytes (0: never roll based on file size)',false,'0','text',true);
insert into general_config values ('hdfs_Sink','hdfs.rollCount','Roll Count','Number of events written to file before it rolled (0 = never roll based on number of events)',false,'0','text',true);
insert into general_config values ('hdfs_Sink','hdfs.idleTimeout','Idle TimeOut','Timeout after which inactive files get closed (0 = disable automatic closing of idle files)',false,'0','text',true);
insert into general_config values ('hdfs_Sink','hdfs.batchSize','Batch Size','number of events written to file before it is flushed to HDFS',false,'100','text',true);
insert into general_config values ('hdfs_Sink','hdfs.codeC','Codec','Compression codec. one of following : gzip, bzip2, lzo, lzop, snappy',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.fileType','File Type','File format: currently SequenceFile, DataStream or CompressedStream (1)DataStream will not compress output file and please don’t set codeC (2)CompressedStream requires set hdfs.codeC with an available codeC',false,'SequenceFile','text',true);
insert into general_config values ('hdfs_Sink','hdfs.maxOpenFiles','Max Open Files','Allow only this number of open files. If this number is exceeded, the oldest file is closed.',false,'5000','text',true);
insert into general_config values ('hdfs_Sink','hdfs.minBlockReplicas','Min Block Replicas','Specify minimum number of replicas per HDFS block. If not specified, it comes from the default Hadoop config in the classpath.',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.writeFormat','Write Format','Format for sequence file records. One of “Text” or “Writable” (the default).',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.callTimeout','Call Timeout','Number of milliseconds allowed for HDFS operations, such as open, write, flush, close. This number should be increased if many HDFS timeout operations are occurring.',false,'10000','text',true);
insert into general_config values ('hdfs_Sink','hdfs.threadsPoolSize','Threads Pool Size','Number of threads per HDFS sink for HDFS IO ops (open, write, etc.)',false,'10','text',true);
insert into general_config values ('hdfs_Sink','hdfs.rollTimerPoolSize','Roll Timer Pool Size','Number of threads per HDFS sink for scheduling timed file rolling',false,'1','text',true);
insert into general_config values ('hdfs_Sink','hdfs.kerberosPrincipal','Kerberos Principal','Kerberos user principal for accessing secure HDFS',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.kerberosKeytab','Kerberos Keytab','Kerberos keytab for accessing secure HDFS',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.proxyUser','HDFS Proxy User','HDFS proxy user',false,null,'text',true);
insert into general_config values ('hdfs_Sink','hdfs.round','HDFS Round','Should the timestamp be rounded down (if true, affects all time based escape sequences except %t)',false,'false','text',true);
insert into general_config values ('hdfs_Sink','hdfs.roundValue','HDFS Round Value','Rounded down to the highest multiple of this (in the unit configured using hdfs.roundUnit), less than current time.',false,'1','text',true);
insert into general_config values ('hdfs_Sink','hdfs.roundUnit','HDFS Round Unit','The unit of the round down value - second, minute or hour.',false,'second','text',true);
insert into general_config values ('hdfs_Sink','hdfs.timeZone','HDFS Time Zone','Name of the timezone that should be used for resolving the directory path',false,'Local Time','text',true);
insert into general_config values ('hdfs_Sink','hdfs.useLocalTimeStamp','Local Time Stamp','Use the local time (instead of the timestamp from the event header) while replacing the escape sequences.',false,'true','text',true);
insert into general_config values ('hdfs_Sink','hdfs.closeTries','Close Tries','Number of times the sink must try renaming a file, after initiating a close attempt. If set to 1, this sink will not re-try a failed rename (due to, for example, NameNode or DataNode failure), and may leave the file in an open state with a .tmp extension. If set to 0, the sink will try to rename the file until the file is eventually renamed (there is no limit on the number of times it would try). The file may still remain open if the close call fails but the data will be intact and in this case, the file will be closed only after a Flume restart.',false,'0','text',true);
insert into general_config values ('hdfs_Sink','hdfs.retryInterval','Retry Interval','Time in seconds between consecutive attempts to close a file. Each close call costs multiple RPC round-trips to the Namenode, so setting this too low can cause a lot of load on the name node. If set to 0 or less, the sink will not attempt to close the file if the first attempt fails, and may leave the file open or with a ”.tmp” extension.',false,'180','text',true);
insert into general_config values ('hdfs_Sink','serializer','Serializer','Other possible options include avro_event or the fully-qualified class name of an implementation of the EventSerializer.Builder interface.',false,'TEXT','text',true);

# # Properties associated with hive sink

insert into general_config values ('hive_Sink','hive.metastore','Hive MetaStore','Hive metastore URI ',true,'thrift://localhost:9083 ','text',true);
insert into general_config values ('hive_Sink','hive.database','Hive Database','Hive Database name',true,'base','text',true);
insert into general_config values ('hive_Sink','hive.table','Hive Table','Hive Table name',true,'ingested_data','text',true);
insert into general_config values ('hive_Sink','hive.partition','Hive Partition','Comma separate list of partition values identifying the partition to write to',false,null,'text',true);
insert into general_config values ('hive_Sink','hive.txnsPerBatchAsk','Hive Transaction Per Batch','Hive grants a batch of transactions instead of single transactions to streaming clients like Flume. This setting configures the number of desired transactions per Transaction Batch. Data from all transactions in a single batch end up in a single file. Flume will write a maximum of batchSize events in each transaction in the batch. This setting in conjunction with batchSize provides control over the size of each file. Note that eventually Hive will transparently compact these files into larger files.',false,'100','text',true);
insert into general_config values ('hive_Sink','heartBeatInterval','Heart Beat Interval','(In seconds) Interval between consecutive heartbeats sent to Hive to keep unused transactions from expiring. Set this value to 0 to disable heartbeats.',false,'240','text',true);
insert into general_config values ('hive_Sink','autoCreatePartitions','Auto Create Partitions','Flume will automatically create the necessary Hive partitions to stream to',false,'true','text',true);
insert into general_config values ('hive_Sink','batchSize','Batch Size','Max number of events written to Hive in a single Hive transaction',false,'15000','text',true);
insert into general_config values ('hive_Sink','maxOpenConnections','Max Open Connections','Allow only this number of open connections. If this number is exceeded, the least recently used connection is closed.',false,'500','text',true);
insert into general_config values ('hive_Sink','callTimeout','Call Timeout','(In milliseconds) Timeout for Hive and HDFS I/O operations, such as openTxn, write, commit, abort.',false,'10000','text',true);
insert into general_config values ('hive_Sink','serializer','Hive Partition','Serializer is responsible for parsing out field from the event and mapping them to columns in the hive table. Choice of serializer depends upon the format of the data in the event. Supported serializers: DELIMITED and JSON',false,null,'text',true);
insert into general_config values ('hive_Sink','roundUnit','Round Unit','The unit of the round down value - second, minute or hour.',false,'minute','text',true);
insert into general_config values ('hive_Sink','roundValue','Round Value','Rounded down to the highest multiple of this (in the unit configured using hive.roundUnit), less than current time',false,'1','text',true);
insert into general_config values ('hive_Sink','timeZone','Time Zone','Name of the timezone that should be used for resolving the escape sequences in partition',false,'Local Time','text',true);
insert into general_config values ('hive_Sink','useLocalTimeStamp','Use Local TimeStamp','Use the local time (instead of the timestamp from the event header) while replacing the escape sequences.',false,'true','text',true);
insert into general_config values ('hive_Sink','serializer.delimiter','Serializer Delimiter','(Type: string) The field delimiter in the incoming data. To use special characters, surround them with double quotes like “\t”',false,',','text',true);
insert into general_config values ('hive_Sink','serializer.fieldnames','Serializer Field Names','The mapping from input fields to columns in hive table. Specified as a comma separated list (no spaces) of hive table columns names, identifying the input fields in order of their occurrence. To skip fields leave the column name unspecified. Eg. ‘time,,ip,message’ indicates the 1st, 3rd and 4th fields in input map to time, ip and message columns in the hive table.',false,null,'text',true);
insert into general_config values ('hive_Sink','serializer.serdeSeparator','Serializer Serde Separator','(Type: character) Customizes the separator used by underlying serde. There can be a gain in efficiency if the fields in serializer.fieldnames are in same order as table columns, the serializer.delimiter is same as the serializer.serdeSeparator and number of fields in serializer.fieldnames is less than or equal to number of table columns, as the fields in incoming event body do not need to be reordered to match order of table columns. Use single quotes for special characters like ‘\t’. Ensure input fields do not contain this character. NOTE: If serializer.delimiter is a single character, preferably set this to the same character',false,'Ctrl-A','text',true);

# Properties associated with logger sink

insert into general_config values ('logger_Sink','maxBytesToLog','Max Bytes To Log','Maximum number of bytes of the Event body to log ',false,'16','text',true);

# Properties associated with avro sink

insert into general_config values ('avro_Sink','hostname','Hostname','The hostname or IP address to bind to.','1','localhost','text',true);
insert into general_config values ('avro_Sink','port','Port','The port # to listen on.','1','8080','text',true);
insert into general_config values ('avro_Sink','batch-size','Batch Size','number of event to batch together for send.','0','100','text',true);
insert into general_config values ('avro_Sink','connect-timeout','Connect Timeout','Amount of time (ms) to allow for the first (handshake) request.','0','20000','text',true);
insert into general_config values ('avro_Sink','request-timeout','Request Timeout','Amount of time (ms) to allow for requests after the first.','0','20000','text',true);
insert into general_config values ('avro_Sink','reset-connection-interval','Reset Connection Interval','Amount of time (s) before the connection to the next hop is reset. This will force the Avro Sink to reconnect to the next hop. This will allow the sink to connect to hosts behind a hardware load-balancer when news hosts are added without having to restart the agent.','0','none','text',true);
insert into general_config values ('avro_Sink','compression-type','Compression Type','This can be “none” or “deflate”. The compression-type must match the compression-type of matching AvroSource','0','none','text',true);
insert into general_config values ('avro_Sink','compression-level','Compression Level','The level of compression to compress event. 0 = no compression and 1-9 is compression. The higher the number the more compression','0','6','text',true);
insert into general_config values ('avro_Sink','ssl','Ssl','Set to true to enable SSL for this AvroSink. When configuring SSL, you can optionally set a “truststore”, “truststore-password”, “truststore-type”, and specify whether to “trust-all-certs”.','0','FALSE','text',true);
insert into general_config values ('avro_Sink','trust-all-certs','Trust All Certs','If this is set to true, SSL server certificates for remote servers (Avro Sources) will not be checked. This should NOT be used in production because it makes it easier for an attacker to execute a man-in-the-middle attack and “listen in” on the encrypted connection.','0','FALSE','text',true);
insert into general_config values ('avro_Sink','truststore','Truststore','The path to a custom Java truststore file. Flume uses the certificate authority information in this file to determine whether the remote Avro Source’s SSL authentication credentials should be trusted. If not specified, the default Java JSSE certificate authority files (typically “jssecacerts” or “cacerts” in the Oracle JRE) will be used.','0',null,'text',true);
insert into general_config values ('avro_Sink','truststore-password','Truststore Password','The password for the specified truststore.','0',null,'text',true);
insert into general_config values ('avro_Sink','truststore-type','Truststore Type','The type of the Java truststore. This can be “JKS” or other supported Java truststore type.','0','JKS','text',true);
insert into general_config values ('avro_Sink','exclude-protocols','Exclud Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 will always be excluded in addition to the protocols specified.','0','SSLv3','text',true);
insert into general_config values ('avro_Sink','maxIoWorkers','Max IO Workers','The maximum number of I/O worker threads. This is configured on the NettyAvroRpcClient NioClientSocketChannelFactory.','0','2 * the number of available processors in the machine','text',true);

# Properties associated with thrift sink

insert into general_config values('thrift_Sink','hostname','Hostname','The hostname or IP address to bind to.','1','localhost','text',true);
insert into general_config values('thrift_Sink','port','Port','The port # to listen on.','1','9083','text',true);
insert into general_config values('thrift_Sink','batch-size','Batch Size','number of event to batch together for send.','0','100','text',true);
insert into general_config values('thrift_Sink','connect-timeout','Connect Timeout','Amount of time (ms) to allow for the first (handshake) request.','0','20000','text',true);
insert into general_config values('thrift_Sink','request-timeout','Request Timeout','Amount of time (ms) to allow for requests after the first.','0','20000','text',true);
insert into general_config values('thrift_Sink','connection-reset-interval','Connection Reset Interval','Amount of time (s) before the connection to the next hop is reset. This will force the Thrift Sink to reconnect to the next hop. This will allow the sink to connect to hosts behind a hardware load-balancer when news hosts are added without having to restart the agent.','0','none','text',true);
insert into general_config values('thrift_Sink','ssl','Ssl','Set to true to enable SSL for this ThriftSink. When configuring SSL, you can optionally set a “truststore”, “truststore-password” and “truststore-type”','0','FALSE','text',true);
insert into general_config values('thrift_Sink','truststore','Trust Store','The path to a custom Java truststore file. Flume uses the certificate authority information in this file to determine whether the remote Thrift Source’s SSL authentication credentials should be trusted. If not specified, the default Java JSSE certificate authority files (typically “jssecacerts” or “cacerts” in the Oracle JRE) will be used.','0',null,'text',true);
insert into general_config values('thrift_Sink','truststore-password','Truststore Password','The password for the specified truststore.','0',null,'text',true);
insert into general_config values('thrift_Sink','truststore-type','Truststore Type','The type of the Java truststore. This can be “JKS” or other supported Java truststore type.','0','JKS','text',true);
insert into general_config values('thrift_Sink','exclude-protocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude','0','SSLv3','text',true);
insert into general_config values('thrift_Sink','kerberos','Kerberos','Set to true to enable kerberos authentication. In kerberos mode, client-principal, client-keytab and server-principal are required for successful authentication and communication to a kerberos enabled Thrift Source.','0','FALSE','text',true);
insert into general_config values('thrift_Sink','client-principal','Client Principal','The kerberos principal used by the Thrift Sink to authenticate to the kerberos KDC.','0',null,'text',true);
insert into general_config values('thrift_Sink','client-keytab','Client Keytab','The keytab location used by the Thrift Sink in combination with the client-principal to authenticate to the kerberos KDC.','0',null,'text',true);
insert into general_config values('thrift_Sink','server-principal','Server Principal','The kerberos principal of the Thrift Source to which the Thrift Sink is configured to connect to.','0',null,'text',true);

# Properties associated with IRC sink

insert into general_config values('irc_Sink','hostname','Hostname','The hostname or IP address to connect to','1','localhost','text',true);
insert into general_config values('irc_Sink','port','Port','The port number of remote host to connect','0','6667','text',true);
insert into general_config values('irc_Sink','nick','Nick','Nick name','1','irc_nick','text',true);
insert into general_config values('irc_Sink','user','User','User name','0',null,'text',true);
insert into general_config values('irc_Sink','password','Password','User password','0',null,'text',true);
insert into general_config values('irc_Sink','chan','Chan','channel','1',null,'text',true);
insert into general_config values('irc_Sink','name','Name','','0',null,'text',true);
insert into general_config values('irc_Sink','splitlines','Split Lines','(boolean)','0',null,'text',true);
insert into general_config values('irc_Sink','splitchars','Split Chars','line separator (if you were to enter the default value into the config file, then you would need to escape the backslash, like this: “\n”)','0','n','text',true);

# Properties associated with File Roll sink

insert into general_config values('file_roll_Sink','sink.directory','Sink Directory','The directory where files will be stored','1','/home/bdreusr/file_roll','text',true);
insert into general_config values('file_roll_Sink','sink.rollInterval','Sink Rollinterval','Roll the file every 30 seconds. Specifying 0 will disable rolling and cause all events to be written to a single file.','0','30','text',true);
insert into general_config values('file_roll_Sink','sink.serializer','Sink Serializer','Other possible options include avro_event or the FQCN of an implementation of EventSerializer.Builder interface.','0','TEXT','text',true);
insert into general_config values('file_roll_Sink','batchSize','Batch Size','Batch Size when file will close','0','100','text',true);


# Properties associated with HBase sink

insert into general_config values('hbase_Sink','table','Table','The name of the table in Hbase to write to.','1','ingested_data','text',true);
insert into general_config values('hbase_Sink','columnFamily','ColumnFamily','The column family in Hbase to write to.','1','ingested_column','text',true);
insert into general_config values('hbase_Sink','zookeeperQuorum','Zookeeper Quorum','The quorum spec. This is the value for the property hbase.zookeeper.quorum in hbase-site.xml','0',null,'text',true);
insert into general_config values('hbase_Sink','znodeParent','Z node parent','The base path for the znode for the -ROOT- region. Value of zookeeper.znode.parent in hbase-site.xml','0','hbase','text',true);
insert into general_config values('hbase_Sink','batchSize','Batch size','Number of events to be written per txn.','0','100','text',true);
insert into general_config values('hbase_Sink','coalesceIncrements','Coalesce increments','Should the sink coalesce multiple increments to a cell per batch. This might give better performance if there are multiple increments to a limited number of cells.','0','FALSE','text',true);
insert into general_config values('hbase_Sink','serializer','Serializer','Default increment column = “iCol”, payload column = “pCol”.','0','org.apache.flume.sink.hbase.SimpleHbaseEventSerializer','text',true);
insert into general_config values('hbase_Sink','serializer.*','Serializer','Properties to be passed to the serializer.','0',null,'text',true);
insert into general_config values('hbase_Sink','kerberosPrincipal','Kerberos principal','Kerberos user principal for accessing secure HBase','0',null,'text',true);
insert into general_config values('hbase_Sink','kerberosKeytab','Kerberos keytab','Kerberos keytab for accessing secure HBase','0',null,'text',true);

# Properties associated with Async HBase sink

insert into general_config value('asynchbase_Sink','table','Table','The name of the table in Hbase to write to.','1','ingested_data','text',true);
insert into general_config value('asynchbase_Sink','zookeeperQuorum','Zookeeper quorum','The quorum spec. This is the value for the property hbase.zookeeper.quorum in hbase-site.xml','0',null,'text',true);
insert into general_config value('asynchbase_Sink','znodeParent','Znode parent','The base path for the znode for the -ROOT- region. Value of zookeeper.znode.parent in hbase-site.xml','0','/hbase','text',true);
insert into general_config value('asynchbase_Sink','columnFamily','Column family','The column family in Hbase to write to.','1','ingested_column','text',true);
insert into general_config value('asynchbase_Sink','batchSize','Batch size','Number of events to be written per txn.','0','100','text',true);
insert into general_config value('asynchbase_Sink','coalesceIncrements','Coalesce increments','Should the sink coalesce multiple increments to a cell per batch. This might give better performance if there are multiple increments to a limited number of cells.','0','FALSE','text',true);
insert into general_config value('asynchbase_Sink','timeout','Timeout','The length of time (in milliseconds) the sink waits for acks from hbase for all events in a transaction.','0','60000','text',true);
insert into general_config value('asynchbase_Sink','serializer','Serializer','','0','org.apache.flume.sink.hbase.SimpleAsyncHbaseEventSerializer','text',true);
insert into general_config value('asynchbase_Sink','serializer.*','Serializer','Properties to be passed to the serializer.','0',null,'text',true);

# Properties associated with org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink

insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','morphlineFile','Morphline file','The relative or absolute path on the local file system to the morphline configuration file. Example: /etc/flume-ng/conf/morphline.conf','1','/etc/flume-ng/conf/morphline.conf','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','morphlineId','Morphline id','Optional name used to identify a morphline if there are multiple morphlines in a morphline config file','0','null','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','batchSize','Batch size','The maximum number of events to take per flume transaction.','0','1000','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','batchDurationMillis','Batch duration millis','The maximum duration per flume transaction (ms). The transaction commits after this duration or when batchSize is exceeded, whichever comes first.','0','1000','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','handlerClass','Handler class','The FQCN of a class implementing org.apache.flume.sink.solr.morphline.MorphlineHandler','0','org.apache.flume.sink.solr.morphline.MorphlineHandlerImpl','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','isProductionMode','Is production mode','This flag should be enabled for mission critical, large-scale online production systems that need to make progress without downtime when unrecoverable exceptions occur. Corrupt or malformed parser input data, parser bugs, and errors related to unknown Solr schema fields produce unrecoverable exceptions.','0','FALSE','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','recoverableExceptionClasses','Recoverable exception classes','Comma separated list of recoverable exceptions that tend to be transient, in which case the corresponding task can be retried. Examples include network connection errors, timeouts, etc. When the production mode flag is set to true, the recoverable exceptions configured using this parameter will not be ignored and hence will lead to retries.','0','org.apache.solr.client.solrj.SolrServerException','text',true);
insert into general_config values('org.apache.flume.sink.solr.morphline.MorphlineSolrSink_Sink','isIgnoringRecoverableExceptions','Is ignoringre coverable exceptions','This flag should be enabled, if an unrecoverable exception is accidentally misclassified as recoverable. This enables the sink to make progress and avoid retrying an event forever.','0','FALSE','text',true);

# Properties associated with org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink

insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','hostNames','Hostnames','Comma separated list of hostname:port, if the port is not present the default port ‘9300’ will be used','1','localhost:9300','text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','indexName','Index name','The name of the index which the date will be appended to. Example ‘flume’ -> ‘flume-yyyy-MM-dd’ Arbitrary header substitution is supported, eg. %{header} replaces with value of named event header','0','flume','text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','indexType','Index type','The type to index the document to, defaults to ‘log’ Arbitrary header substitution is supported, eg. %{header} replaces with value of named event header','0','logs','text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','clusterName','Cluster name','Name of the ElasticSearch cluster to connect to','0','elasticsearch','text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','batchSize','Batch size','Number of events to be written per txn.','0','100','text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','ttl','Ttl','TTL in days, when set will cause the expired documents to be deleted automatically, if not set documents will never be automatically deleted. TTL is accepted both in the earlier form of integer only e.g. a1.sinks.k1.ttl = 5 and also with a qualifier ms (millisecond), s (second), m (minute), h (hour), d (day) and w (week). Example a1.sinks.k1.ttl = 5d will set TTL to 5 days. Follow http://www.elasticsearch.org/guide/reference/mapping/ttl-field/ for more information.','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','serializer','Serializer','The ElasticSearchIndexRequestBuilderFactory or ElasticSearchEventSerializer to use. Implementations of either class are accepted but ElasticSearchIndexRequestBuilderFactory is preferred.','0','org.apache.flume.sink.elasticsearch.ElasticSearchLogStashEventSerializer','text',true);
insert into general_config values('org.apache.flume.sink.elasticsearch.ElasticSearchSink_Sink','serializer.*','Serializer','Properties to be passed to the serializer.','0',null,'text',true);

# Properties associated with org.apache.flume.sink.kite.DatasetSink_Sink

insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.dataset.uri','Kite Dataset Uri','URI of the dataset to open','1','hdfs://localhost:8020','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.repo.uri','Kite Repo Uri','URI of the repository to open (deprecated; use kite.dataset.uri instead)','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.dataset.namespace','Kite Dataset Namespace','Namespace of the Dataset where records will be written (deprecated; use kite.dataset.uri instead)','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.dataset.name','Kite Dataset Name','Name of the Dataset where records will be written (deprecated; use kite.dataset.uri instead)','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.batchSize','Kite Batchsize','Number of records to process in each batch','0','100','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.rollInterval','Kite Rollinterval','Maximum wait time (seconds) before data files are released','0','30','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.flushable.commitOnBatch','Kite Flushable Commitonbatch','If true, the Flume transaction will be commited and the writer will be flushed on each batch of kite.batchSize records. This setting only applies to flushable datasets. When true, it’s possible for temp files with commited data to be left in the dataset directory. These files need to be recovered by hand for the data to be visible to DatasetReaders.','0','TRUE','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.syncable.syncOnBatch','Kite Syncable Synconbatch','Controls whether the sink will also sync data when committing the transaction. This setting only applies to syncable datasets. Syncing gaurentees that data will be written on stable storage on the remote system while flushing only gaurentees that data has left Flume’s client buffers. When the kite.flushable.commitOnBatch property is set to false, this property must also be set to false.','0','TRUE','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.entityParser','Kite Entityparser','Parser that turns Flume Events into Kite entities. Valid values are avro and the fully-qualified class name of an implementation of the EntityParser.Builder interface.','0','avro','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.failurePolicy','Kite  Failurepolicy','Policy that handles non-recoverable errors such as a missing Schema in the Event header. The default value, retry, will fail the current batch and try again which matches the old behavior. Other valid values are save, which will write the raw Event to the kite.error.dataset.uri dataset, and the fully-qualified class name of an implementation of the FailurePolicy.Builder interface.','0','retry','text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','kite.error.dataset.uri','Kite Error Dataset Uri','URI of the dataset where failed events are saved when kite.failurePolicy is set to save. Required when the kite.failurePolicy is set to save.','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','auth.kerberosPrincipal','Auth Kerberosprincipal','Kerberos user principal for secure authentication to HDFS','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','auth.kerberosKeytab','Auth Kerberoskeytab','Kerberos keytab location (local FS) for the principal','0',null,'text',true);
insert into general_config values('org.apache.flume.sink.kite.DatasetSink_Sink','auth.proxyUser','Auth Proxyuser','The effective user for HDFS actions, if different from the kerberos principal','0',null,'text',true);

# Properties associated with Kafka Sink

insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','brokerList','Broker list','List of brokers Kafka-Sink will connect to, to get the list of topic partitions This can be a partial list of brokers, but we recommend at least two for HA. The format is comma separated list of hostname:port','1','localhost:8080','text',true);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','topic','Topic','The topic in Kafka to which the messages will be published. If this parameter is configured, messages will be published to this topic. If the event header contains a “topic” field, the event will be published to that topic overriding the topic configured here.','0','default-flume-topic','text',true);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','batchSize','Batch size','How many messages to process in one batch. Larger batches improve throughput while adding latency.','0','100','text',true);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','requiredAcks','Required acks','How many replicas must acknowledge a message before its considered successfully written. Accepted values are 0 (Never wait for acknowledgement), 1 (wait for leader only), -1 (wait for all replicas) Set this to -1 to avoid data loss in some cases of leader failure.','0','1','text',true);
insert into general_config values('org.apache.flume.sink.kafka.KafkaSink_Sink','Other Kafka Producer Properties','Other Kafka Producer Properties','These properties are used to configure the Kafka Producer. Any producer property supported by Kafka can be used. The only requirement is to prepend the property name with the prefix kafka.. For example: kafka.producer.type','0',null,'text',true);

# Types of Channel Type Supported in flume
insert into general_config values ('Channel_Type','memory','Memory','The events are stored in an in-memory queue with configurable max size. It’s ideal for flows that need higher throughput and are prepared to lose the staged data in the event of a agent failures',false,'memory','text',true);
insert into general_config values ('Channel_Type','jdbc','JDBC','The events are stored in a persistent storage that’s backed by a database. The JDBC channel currently supports embedded Derby. This is a durable channel that is ideal for flows where recoverability is important',false,'jdbc','text',true);
insert into general_config values ('Channel_Type','org.apache.flume.channel.kafka.KafkaChannel','Kafka','The events are stored in a Kafka cluster (must be installed separately). Kafka provides high availability and replication, so in case an agent or a kafka broker crashes, the events are immediately available to other sinks',false,'org.apache.flume.channel.kafka.KafkaChannel','text',true);
insert into general_config values ('Channel_Type','file','File','file channel',false,'file','text',true);
insert into general_config values ('Channel_Type','SPILLABLEMEMORY','Spillable Memory','The events are stored in an in-memory queue and on disk. The in-memory queue serves as the primary store and the disk as overflow',false,'SPILLABLEMEMORY','text',true);
insert into general_config values ('Channel_Type','org.apache.flume.channel.PseudoTxnMemoryChannel','Pseudo Txn Memory Channel','The Pseudo Transaction Channel is only for unit testing purposes and is NOT meant for production use.',false,'org.apache.flume.channel.PseudoTxnMemoryChannel','text',true);
insert into general_config values ('Channel_Type','FQCN','Custom','Custom channel',false,'FQCN','text',true);

# Properties associated with Memory Channel

insert into general_config values ('memory_Channel','capacity','Capacity','The maximum number of events stored in the channel','0','100','text',true);
insert into general_config values ('memory_Channel','transactionCapacity','Transaction capacity','The maximum number of events the channel will take from a source or give to a sink per transaction','0','100','text',true);
insert into general_config values ('memory_Channel','keep-alive','Keep Alive','Timeout in seconds for adding or removing an event','0','3','text',true);
insert into general_config values ('memory_Channel','byteCapacityBufferPercentage','Byte capacity buffer percentage','Defines the percent of buffer between byteCapacity and the estimated total size of all events in the channel, to account for data in headers. See below.','0','20','text',true);
insert into general_config values ('memory_Channel','byteCapacity','Byte capacity','Maximum total bytes of memory allowed as a sum of all events in this channel. The implementation only counts the Event body, which is the reason for providing the byteCapacityBufferPercentage configuration parameter as well. Defaults to a computed value equal to 80% of the maximum memory available to the JVM (i.e. 80% of the -Xmx value passed on the command line). Note that if you have multiple memory channels on a single JVM, and they happen to hold the same physical events (i.e. if you are using a replicating channel selector from a single source) then those event sizes may be double-counted for channel byteCapacity purposes. Setting this value to 0 will cause this value to fall back to a hard internal limit of about 200 GB.','0','see description','text',true);

# Properties associated with jdbc Channel

insert into general_config values('jdbc_Channel','db.type','Db Type','Database vendor, needs to be DERBY.','0','DERBY','text',true);
insert into general_config values('jdbc_Channel','driver.class','Driver Class','Class for vendor’s JDBC driver','0','org.apache.derby.jdbc.EmbeddedDriver','text',true);
insert into general_config values('jdbc_Channel','driver.url','Driver Url','JDBC connection URL','0','(constructed from other properties)','text',true);
insert into general_config values('jdbc_Channel','db.username','Db Username','User id for db connection','0','“sa”','text',true);
insert into general_config values('jdbc_Channel','db.password','Db Password','password for db connection','0',null,'text',true);
insert into general_config values('jdbc_Channel','connection.properties.file','Connection Properties File','JDBC Connection property file path','0',null,'text',true);
insert into general_config values('jdbc_Channel','create.schema','Create Schema','If true, then creates db schema if not there','0','TRUE','text',true);
insert into general_config values('jdbc_Channel','create.index','Create Index','Create indexes to speed up lookups','0','TRUE','text',true);
insert into general_config values('jdbc_Channel','create.foreignkey','Create Foreignkey','','0','TRUE','text',true);
insert into general_config values('jdbc_Channel','transaction.isolation','Transaction Isolation','Isolation level for db session READ_UNCOMMITTED, READ_COMMITTED, SERIALIZABLE, REPEATABLE_READ','0','“READ_COMMITTED”','text',true);
insert into general_config values('jdbc_Channel','maximum.connections','Maximum Connections','Max connections allowed to db','0','10','text',true);
insert into general_config values('jdbc_Channel','maximum.capacity','Maximum Capacity','Max number of events in the channel','0','0','text',true);
insert into general_config values('jdbc_Channel','sysprop.*','Sysprop','DB Vendor specific properties','0',null,'text',true);
insert into general_config values('jdbc_Channel','sysprop.user.home','Sysprop User Home','Home path to store embedded Derby database','0',null,'text',true);

# Properties associated with kafka Channel

insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','brokerList','Broker list','List of brokers in the Kafka cluster used by the channel This can be a partial list of brokers, but we recommend at least two for HA. The format is comma separated list of hostname:port','1','localhost:8080','text',true);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','zookeeperConnect','Zookeeper connect','URI of ZooKeeper used by Kafka cluster The format is comma separated list of hostname:port. If chroot is used, it is added once at the end. For example: zookeeper-1:2181,zookeeper-2:2182,zookeeper-3:2181/kafka','1','zookeeper-1:2181,zookeeper-2:2182,zookeeper-3:2181/kafka','text',true);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','topic','Topic','Kafka topic which the channel will use','0','flume-channel','text',true);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','groupId','Group id','Consumer group ID the channel uses to register with Kafka. Multiple channels must use the same topic and group to ensure that when one agent fails another can get the data Note that having non-channel consumers with the same ID can lead to data loss.','0','flume','text',true);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','parseAsFlumeEvent','Parse as flume event','Expecting Avro datums with FlumeEvent schema in the channel. This should be true if Flume source is writing to the channel And false if other producers are writing into the topic that the channel is using Flume source messages to Kafka can be parsed outside of Flume by using org.apache.flume.source.avro.AvroFlumeEvent provided by the flume-ng-sdk artifact','0','TRUE','text',true);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','readSmallestOffset','Read smallest offset','When set to true, the channel will read all data in the topic, starting from the oldest event when false, it will read only events written after the channel started When “parseAsFlumeEvent” is true, this will be false. Flume source will start prior to the sinks and this guarantees that events sent by source before sinks start will not be lost.','0','FALSE','text',true);
insert into general_config values('org.apache.flume.channel.kafka.KafkaChannel_Channel','Other Kafka Properties','Other Kafka Properties','These properties are used to configure the Kafka Producer and Consumer used by the channel. Any property supported by Kafka can be used. The only requirement is to prepend the property name with the prefix kafka.. For example: kafka.producer.type','0',null,'text',true);

# Properties associated with file Channel

insert into general_config values('file_Channel','checkpointDir','Checkpoint dir','The directory where checkpoint file will be stored','0','~/.flume/file-channel/checkpoint','text',true);
insert into general_config values('file_Channel','useDualCheckpoints','Use dual check points','Backup the checkpoint. If this is set to true, backupCheckpointDir must be set','0','FALSE','text',true);
insert into general_config values('file_Channel','backupCheckpointDir','Backup check point dir','The directory where the checkpoint is backed up to. This directory must not be the same as the data directories or the checkpoint directory','0',null,'text',true);
insert into general_config values('file_Channel','dataDirs','Data dirs','Comma separated list of directories for storing log files. Using multiple directories on separate disks can improve file channel peformance','0','~/.flume/file-channel/data','text',true);
insert into general_config values('file_Channel','transactionCapacity','Transaction capacity','The maximum size of transaction supported by the channel','0','10000','text',true);
insert into general_config values('file_Channel','checkpointInterval','Check point interval','Amount of time (in millis) between checkpoints','0','30000','text',true);
insert into general_config values('file_Channel','maxFileSize','Max file size','Max size (in bytes) of a single log file','0','2146435071','text',true);
insert into general_config values('file_Channel','minimumRequiredSpace','Minimum required space','Minimum Required free space (in bytes). To avoid data corruption, File Channel stops accepting take/put requests when free space drops below this value','0','524288000','text',true);
insert into general_config values('file_Channel','capacity','Capacity','Maximum capacity of the channel','0','1000000','text',true);
insert into general_config values('file_Channel','keep-alive','Keep Alive','Amount of time (in sec) to wait for a put operation','0','3','text',true);
insert into general_config values('file_Channel','use-log-replay-v1','Use Log Replay V1','Expert: Use old replay logic','0','FALSE','text',true);
insert into general_config values('file_Channel','use-fast-replay','Use Fast Replay','Expert: Replay without using queue','0','FALSE','text',true);
insert into general_config values('file_Channel','checkpointOnClose','Check point on close','Controls if a checkpoint is created when the channel is closed. Creating a checkpoint on close speeds up subsequent startup of the file channel by avoiding replay.','0','TRUE','text',true);
insert into general_config values('file_Channel','encryption.activeKey','Encryption Activekey','Key name used to encrypt new data','0',null,'text',true);
insert into general_config values('file_Channel','encryption.cipherProvider','Encryption Cipherprovider','Cipher provider type, supported types: AESCTRNOPADDING','0',null,'text',true);
insert into general_config values('file_Channel','encryption.keyProvider','Encryption Keyprovider','Key provider type, supported types: JCEKSFILE','0',null,'text',true);
insert into general_config values('file_Channel','encryption.keyProvider.keyStoreFile','Encryption Keyprovider Keystorefile','Path to the keystore file','0',null,'text',true);
insert into general_config values('file_Channel','encrpytion.keyProvider.keyStorePasswordFile','Encrpytion Keyprovider Keystore password file','Path to the keystore password file','0',null,'text',true);
insert into general_config values('file_Channel','encryption.keyProvider.keys','Encryption Keyprovider Keys','List of all keys (e.g. history of the activeKey setting)','0',null,'text',true);
insert into general_config values('file_Channel','encyption.keyProvider.keys.*.passwordFile','Encyption Keyprovider Keys Password file','Path to the optional key password file','0',null,'text',true);

# Properties associated with SPILLABLEMEMORY Channel

insert into general_config values('SPILLABLEMEMORY_Channel','memoryCapacity','Memory capacity','Maximum number of events stored in memory queue. To disable use of in-memory queue, set this to zero.','0','10000','text',true);
insert into general_config values('SPILLABLEMEMORY_Channel','overflowCapacity','Over flow capacity','Maximum number of events stored in overflow disk (i.e File channel). To disable use of overflow, set this to zero.','0','100000000','text',true);
insert into general_config values('SPILLABLEMEMORY_Channel','overflowTimeout','Over flow timeout','The number of seconds to wait before enabling disk overflow when memory fills up.','0','3','text',true);
insert into general_config values('SPILLABLEMEMORY_Channel','byteCapacityBufferPercentage','Byte capacity buffer percentage','Defines the percent of buffer between byteCapacity and the estimated total size of all events in the channel, to account for data in headers. See below.','0','20','text',true);
insert into general_config values('SPILLABLEMEMORY_Channel','byteCapacity','Byte capacity','Maximum bytes of memory allowed as a sum of all events in the memory queue. The implementation only counts the Event body, which is the reason for providing the byteCapacityBufferPercentage configuration parameter as well. Defaults to a computed value equal to 80% of the maximum memory available to the JVM (i.e. 80% of the -Xmx value passed on the command line). Note that if you have multiple memory channels on a single JVM, and they happen to hold the same physical events (i.e. if you are using a replicating channel selector from a single source) then those event sizes may be double-counted for channel byteCapacity purposes. Setting this value to 0 will cause this value to fall back to a hard internal limit of about 200 GB.','0','see description','text',true);
insert into general_config values('SPILLABLEMEMORY_Channel','avgEventSize','Avg event size','Estimated average size of events, in bytes, going into the channel','0','500','text',true);
insert into general_config values('SPILLABLEMEMORY_Channel','<file channel properties>','<File Channel Properties>','Any file channel property with the exception of ‘keep-alive’ and ‘capacity’ can be used. The keep-alive of file channel is managed by Spillable Memory Channel. Use ‘overflowCapacity’ to set the File channel’s capacity.','0','see file channel','text',true);

# Properties associated with Psuedo Transaction Channel

insert into general_config values('org.apache.flume.channel.PseudoTxnMemoryChannel_Channel','capacity','Capacity','The max number of events stored in the channel','0','50','text',true);
insert into general_config values('org.apache.flume.channel.PseudoTxnMemoryChannel_Channel','keep-alive','Keep Alive','Timeout in seconds for adding or removing an event','0','3','text',true);

# Types of Channel Type Supported in flume

insert into general_config values ('Source_Type','avro','Avro','Listens on Avro port and receives events from external Avro client streams',false,'avro','text',true);
insert into general_config values ('Source_Type','thrift','Thrift','Listens on Thrift port and receives events from external Thrift client streams',false,'thrift','text',true);
insert into general_config values ('Source_Type','exec','Exec','Runs a given Unix command on start-up and expects that process to continuously produce data on standard out',false,'exec','text',true);
insert into general_config values ('Source_Type','jms','JMS','Source reads messages from a JMS destination such as a queue or topic',false,'jms','text',true);
insert into general_config values ('Source_Type','spooldir','Spooling Directory','Spooling directory on disk as source',false,'spooldir','text',true);
insert into general_config values ('Source_Type','org.apache.flume.source.twitter.TwitterSource','Twitter 1% firehose','Source that connects via Streaming API to the 1% sample twitter firehose',false,'org.apache.flume.source.twitter.TwitterSource','text',true);
insert into general_config values ('Source_Type','org.apache.flume.source.kafka.KafkaSource','Kafka','Source is an Apache Kafka consumer that reads messages from a Kafka topic',false,'org.apache.flume.source.kafka.KafkaSource','text',true);
insert into general_config values ('Source_Type','netcat','NetCat','Source that listens on a given port and turns each line of text into an event',false,'netcat','text',true);
insert into general_config values ('Source_Type','seq','Sequence Generator','Source continuously generates events with a counter that starts from 0 and increments by 1',false,'seq','text',true);
insert into general_config values ('Source_Type','syslogtcp','Syslog TCP','Syslog TCP source',false,'syslogtcp','text',true);
insert into general_config values ('Source_Type','multiport_syslogtcp','Multiport Syslog TCP','Multi-port capable version of the Syslog TCP source',false,'multiport_syslogtcp','text',true);
insert into general_config values ('Source_Type','syslogudp','Syslog UDP','Syslog UDP source',false,'syslogudp','text',true);
insert into general_config values ('Source_Type','http','HTTP','Accepts Flume Events by HTTP POST and GET',false,'http','text',true);
insert into general_config values ('Source_Type','org.apache.flume.source.StressSource','Stress','StressSource is an internal load-generating source implementation which is very useful for stress tests',false,'org.apache.flume.source.StressSource','text',true);
insert into general_config values ('Source_Type','org.apache.flume.source.avroLegacy.AvroLegacySource','Legacy','Legacy sources allow a Flume 1.x agent to receive events from Flume 0.9.4 agents',false,'org.apache.flume.source.avroLegacy.AvroLegacySource','text',true);
insert into general_config values ('Source_Type','org.apache.flume.source.thriftLegacy.ThriftLegacySource','Thrift Legacy','Thrift Legacy',false,'org.apache.flume.source.thriftLegacy.ThriftLegacySource','text',true);
insert into general_config values ('Source_Type','org.apache.flume.source.scribe.ScribeSource','Scribe','Scribe is another type of ingest system',false,'org.apache.flume.source.scribe.ScribeSource','text',true);

# Properties associated with Avro Source

insert into general_config values ('avro_Source','bind','Bind','hostname or IP address to listen on',true,'localhost','text',true);
insert into general_config values ('avro_Source','port','Port','Port # to bind to',true,'8080','text',true);
insert into general_config values ('avro_Source','threads','Threads','Maximum number of worker threads to spawn',false,null,'text',true);
insert into general_config values ('avro_Source','selector.type','Selector Type','Defines selector type',false,null,'text',true);
insert into general_config values ('avro_Source','selector.*','Selector.*','Selectors',false,null,'text',true);
insert into general_config values ('avro_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values ('avro_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);
insert into general_config values ('avro_Source','compression-type','Compression-type','This can be “none” or “deflate”. The compression-type must match the compression-type of matching AvroSource',false,'none','text',true);
insert into general_config values ('avro_Source','ssl','SSL','Set this to true to enable SSL encryption. You must also specify a “keystore” and a “keystore-password”.',false,'FALSE','text',true);
insert into general_config values ('avro_Source','keystore','Keystore','This is the path to a Java keystore file. Required for SSL.',false,null,'text',true);
insert into general_config values ('avro_Source','keystore-password','Keystore Password','The password for the Java keystore. Required for SSL.',false,null,'text',true);
insert into general_config values ('avro_Source','keystore-type','Keystore Type','The type of the Java keystore. This can be “JKS” or “PKCS12”.',false,'JKS','text',true);
insert into general_config values ('avro_Source','exclude-protocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 will always be excluded in addition to the protocols specified.',false,'SSLv3','text',true);
insert into general_config values ('avro_Source','ipFilter','IP Filter','Set this to true to enable ipFiltering for netty',false,'FALSE','text',true);
insert into general_config values ('avro_Source','ipFilterRules','IP Filter Rules','Define N netty ipFilter pattern rules with this config.',false,null,'text',true);

# Properties associated with Thrift Source

insert into general_config values ('thrift_Source','bind','Bind','hostname or IP address to listen on',true,'localhost','text',true);
insert into general_config values ('thrift_Source','port','Port','Port # to bind to',true,'8080','text',true);
insert into general_config values ('thrift_Source','threads','Threads','Maximum number of worker threads to spawn',false,null,'text',true);
insert into general_config values ('thrift_Source','Selector Type','selector.type','Selector Type',false,null,'text',true);
insert into general_config values ('thrift_Source','selector.*','Selector.*','Selectors',false,null,'text',true);
insert into general_config values ('thrift_Source','interceptors','Interceptors','Space separated list of interceptors',false,null,'text',true);
insert into general_config values ('thrift_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);
insert into general_config values ('thrift_Source','ssl','SSL','Set this to true to enable SSL encryption. You must also specify a “keystore” and a “keystore-password”.',false,'FALSE','text',true);
insert into general_config values ('thrift_Source','keystore','Keystore','This is the path to a Java keystore file. Required for SSL.',false,null,'text',true);
insert into general_config values ('thrift_Source','keystore-password','Keystore Password','The password for the Java keystore. Required for SSL.',false,null,'text',true);
insert into general_config values ('thrift_Source','keystore-type','keystore Type','The type of the Java keystore. This can be “JKS” or “PKCS12”.',false,'JKS','text',true);
insert into general_config values ('thrift_Source','exclude-protocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 will always be excluded in addition to the protocols specified.',false,'SSLv3','text',true);
insert into general_config values ('thrift_Source','kerberos','Kerberos','Set to true to enable kerberos authentication. In kerberos mode, agent-principal and agent-keytab are required for successful authentication. The Thrift source in secure mode, will accept connections only from Thrift clients that have kerberos enabled and are successfully authenticated to the kerberos KDC.',false,'FALSE','text',true);
insert into general_config values ('thrift_Source','agent-principal','Agent Principal','The kerberos principal used by the Thrift Source to authenticate to the kerberos KDC.',false,null,'text',true);
insert into general_config values ('thrift_Source','agent-keytab','Agent Keytab','The keytab location used by the Thrift Source in combination with the agent-principal to authenticate to the kerberos KDC.',false,null,'text',true);

# Properties associated with Exec Source

insert into general_config values ('exec_Source','command','Command','The command to execute',true,'cat /home/bdreusr/flume/flume-test.txt','text',true);
insert into general_config values ('exec_Source','shell','Shell','A shell invocation used to run the command. e.g. /bin/sh -c. Required only for commands relying on shell features like wildcards, back ticks, pipes etc.',false,null,'text',true);
insert into general_config values ('exec_Source','restartThrottle','Restart Throttle','Amount of time (in millis) to wait before attempting a restart',false,'10000','text',true);
insert into general_config values ('exec_Source','restart','Restart','Whether the executed cmd should be restarted if it dies',false,'FALSE','text',true);
insert into general_config values ('exec_Source','logStdErr','Logstderr','Whether the command is stderr should be logged',false,'FALSE','text',true);
insert into general_config values ('exec_Source','batchSize','Batchsize','The max number of lines to read and send to the channel at a time',false,'20','text',true);
insert into general_config values ('exec_Source','batchTimeout','Batchtimeout','Amount of time (in milliseconds) to wait, if the buffer size was not reached, before data is pushed downstream',false,'3000','text',true);
insert into general_config values ('exec_Source','selector.type','Selector.Type','replicating or multiplexing',false,'replicating','text',true);
insert into general_config values ('exec_Source','selector.*','Selector.*','Depends on the selector.type value',false,null,'text',true);
insert into general_config values ('exec_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values ('exec_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);

# Properties associated with JMS Source

insert into general_config values ('jms_Source','initialContextFactory','Initial Context Factory','Inital Context Factory, e.g: org.apache.activemq.jndi.ActiveMQInitialContextFactory',true,'org.apache.activemq.jndi.ActiveMQInitialContextFactory','text',true);
insert into general_config values ('jms_Source','connectionFactory','Connection Factory','The JNDI name the connection factory should appear as',true,'MQ','text',true);
insert into general_config values ('jms_Source','providerURL','Provider URL','The JMS provider URL',true,'http://localhost:8080','text',true);
insert into general_config values ('jms_Source','destinationName','Destination Name','Destination name',true,'hdfs','text',true);
insert into general_config values ('jms_Source','destinationType','Destination Type','Destination type (queue or topic)',true,'queue','text',true);
insert into general_config values ('jms_Source','messageSelector','Message Selector','Message selector to use when creating the consumer',false,null,'text',true);
insert into general_config values ('jms_Source','userName','Username','User Name for the destination/provider',false,null,'text',true);
insert into general_config values ('jms_Source','passwordFile','Password File','File containing the password for the destination/provider',false,null,'text',true);
insert into general_config values ('jms_Source','batchSize','Batch Size','Number of messages to consume in one batch',false,'100','text',true);
insert into general_config values ('jms_Source','converter.type','Converter Type','Class to use to convert messages to flume events. See below.',false,null,'text',true);
insert into general_config values ('jms_Source','converter.*','Converter.*','Converter properties.',false,null,'text',true);
insert into general_config values ('jms_Source','converter.charset','Converter Charset','Default converter only. Charset to use when converting JMS TextMessages to byte arrays.',false,null,'text',true);

# Properties associated with Spool Directory Source

insert into general_config values('spooldir_Source','spoolDir','Spool Dir','The directory from which to read files from.',true,'/home/bdreusr/flume','text',true);
insert into general_config values('spooldir_Source','fileSuffix','File Suffix','Suffix to append to completely ingested files',false,'.COMPLETED','text',true);
insert into general_config values('spooldir_Source','deletePolicy','Delete Policy','When to delete completed files: never or immediate',false,'never','text',true);
insert into general_config values('spooldir_Source','fileHeader','File Header','Whether to add a header storing the absolute path filename.',false,'FALSE','text',true);
insert into general_config values('spooldir_Source','fileHeaderKey','File Header Key','Header key to use when appending absolute path filename to event header.',false,'file','text',true);
insert into general_config values('spooldir_Source','basenameHeader','Basename Header','Whether to add a header storing the basename of the file.',false,'FALSE','text',true);
insert into general_config values('spooldir_Source','basenameHeaderKey','Basename Headerkey','Header Key to use when appending basename of file to event header.',false,'basename','text',true);
insert into general_config values('spooldir_Source','ignorePattern','Ignore Pattern','Regular expression specifying which files to ignore (skip)',false,'^$','text',true);
insert into general_config values('spooldir_Source','trackerDir','Tracker Dir','Directory to store metadata related to processing of files. If this path is not an absolute path, then it is interpreted as relative to the spoolDir.',false,'.flumespool','text',true);

insert into general_config values('spooldir_Source','consumeOrder','Consume Order','In which order files in the spooling directory will be consumed oldest, youngest and random. In case of oldest andyoungest, the last modified time of the files will be used to compare the files. In case of a tie, the file with smallest laxicographical order will be consumed first. In case of random any file will be picked randomly. When using oldest andyoungest the whole directory will be scanned to pick the oldest/youngest file, which might be slow if there are a large number of files, while using random may cause old files to be consumed very late if new files keep coming in the spooling directory.',false,'oldest','text',true);

insert into general_config values('spooldir_Source','maxBackoff','Max Backoff','The maximum time (in millis) to wait between consecutive attempts to write to the channel(s) if the channel is full. The source will start at a low backoff and increase it exponentially each time the channel throws a ChannelException, upto the value specified by this parameter.',false,'4000','text',true);

insert into general_config values('spooldir_Source','batchSize','Batch Size','Granularity at which to batch transfer to the channel',false,'100','text',true);
insert into general_config values('spooldir_Source','inputCharset','Input Charset','Character set used by deserializers that treat the input file as text.',false,'UTF-8','text',true);
insert into general_config values('spooldir_Source','decodeErrorPolicy','Decode Error Policy','What to do when we see a non-decodable character in the input file. FAIL: Throw an exception and fail to parse the file.REPLACE: Replace the unparseable character with the “replacement character” char, typically Unicode U+FFFD. IGNORE: Drop the unparseable character sequence.',false,'FAIL','text',true);
insert into general_config values('spooldir_Source','deserializer','Deserializer','Specify the deserializer used to parse the file into events. Defaults to parsing each line as an event. The class specified must implement EventDeserializer.Builder.',false,'LINE','text',true);
insert into general_config values('spooldir_Source','deserializer.*','Deserializer.*','Varies per event deserializer.',false,null,'text',true);
insert into general_config values('spooldir_Source','bufferMaxLines','Buffer Max Lines','(Obselete) This option is now ignored.',false,null,'text',true);
insert into general_config values('spooldir_Source','bufferMaxLineLength','Buffermax Line Length','(Deprecated) Maximum length of a line in the commit buffer. Use deserializer.maxLineLength instead.',false,'5000','text',true);
insert into general_config values('spooldir_Source','selector.type','Selector Type','replicating or multiplexing',false,'replicating','text',true);
insert into general_config values('spooldir_Source','selector.*','Selector.*','Depends on the selector.type value',false,null,'text',true);
insert into general_config values('spooldir_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('spooldir_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);

# Properties associated with twitter Source

insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','consumerKey','Consumerkey','OAuth consumer key','1','your key','text',true);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','consumerSecret','Consumersecret','OAuth consumer secret','1','your secret','text',true);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','accessToken','Accesstoken','OAuth access token','1','your access token','text',true);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','accessTokenSecret','Accesstokensecret','OAuth toekn secret','1','your acces secret','text',true);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','maxBatchSize','Maxbatchsize','Maximum number of twitter messages to put in a single batch','0','1000','text',true);
insert into general_config values('org.apache.flume.source.twitter.TwitterSource_Source','maxBatchDurationMillis','Maxbatchdurationmillis','Maximum number of milliseconds to wait before closing a batch','0','1000','text',true);

# Properties associated with Kafka Source

insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','zookeeperConnect','Zookeeper Connect','URI of ZooKeeper used by Kafka cluster',true,null,'text',true);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','groupId','Group Id','Unique identified of consumer group. Setting the same id in multiple sources or agents indicates that they are part of the same consumer group',true,'flume','text',true);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','topic','Topic','Kafka topic we will read messages from. At the time, this is a single topic only.',true,null,'text',true);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','batchSize','Batch Size','Maximum number of messages written to Channel in one batch',false,'1000','text',true);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','batchDurationMillis','Batch Duration Millis','Maximum time (in ms) before a batch will be written to Channel The batch will be written whenever the first of size and time will be reached.',false,'1000','text',true);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','backoffSleepIncrement','Backoff Sleep Increment','Initial and incremental wait time that is triggered when a Kafka Topic appears to be empty. Wait period will reduce aggressive pinging of an empty Kafka Topic. One second is ideal for ingestion use cases but a lower value may be required for low latency operations with interceptors.',false,'1000','text',true);
insert into general_config values('org.apache.flume.source.kafka.KafkaSource_Source','maxBackoffSleep','Max Backoff Sleep','Maximum wait time that is triggered when a Kafka Topic appears to be empty. Five seconds is ideal for ingestion use cases but a lower value may be required for low latency operations with interceptors.',false,'5000','text',true);

# Properties associated with Netcat Source

insert into general_config values('netCat_Source','bind','Bind','Host name or IP address to bind to',true,'localhost','text',true);
insert into general_config values('netCat_Source','port','Port','Port # to bind to',true,'8080','text',true);
insert into general_config values('netCat_Source','max-line-length','Max Line Length','Max line length per event body (in bytes)',false,'512','text',true);
insert into general_config values('netCat_Source','ack-every-event','Ack Every Event','Respond with an “OK” for every event received',false,'TRUE','text',true);
insert into general_config values('netCat_Source','selector.type','Selector Type','replicating or multiplexing',false,'replicating','text',true);
insert into general_config values('netCat_Source','selector.*','Selector.*','Depends on the selector.type value',false,null,'text',true);
insert into general_config values('netCat_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('netCat_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);

# Properties associated with sequence generator Source

insert into general_config values('seq_Source','selector.type','Selector Type','replicating or multiplexing',false,null,'text',true);
insert into general_config values('seq_Source','selector.*','Selector.*','Depends on the selector.type value',false,'replicating','text',true);
insert into general_config values('seq_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('seq_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);
insert into general_config values('seq_Source','batchSize','Batch Size','Batch Size',false,'1','text',true);

# Properties associated with Syslog_TCP Source

insert into general_config values('syslogtcp_Source','host','Host','Host name or IP address to bind to',true,'localhost','text',true);
insert into general_config values('syslogtcp_Source','port','Port','Port # to bind to',true,'8080','text',true);
insert into general_config values('syslogtcp_Source','eventSize','EventSize','Maximum size of a single event line, in bytes',false,'2500','text',true);
insert into general_config values('syslogtcp_Source','keepFields','Keep Fields','Setting this to "all" will preserve the Priority, Timestamp and Hostname in the body of the event. A spaced separated list of fields to include is allowed as well. Currently, the following fields can be included: priority, version, timestamp, hostname. The values "true" and "false" have been deprecated in favor of "all" and "none".',false,'none','text',true);
insert into general_config values('syslogtcp_Source','selector.type','Selector Type','replicating or multiplexing',false,null,'text',true);
insert into general_config values('syslogtcp_Source','selector.*','Selector.*','Depends on the selector.type value',false,'replicating','text',true);
insert into general_config values('syslogtcp_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('syslogtcp_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);

# Properties associated with Multiport Syslog_TCP Source

insert into general_config values('multiport_syslogtcp_Source','host','Host','Host name or IP address to bind to.',true,'localhost','text',true);
insert into general_config values('multiport_syslogtcp_Source','ports','Ports','Space-separated list (one or more) of ports to bind to.',true,'8080 8020','text',true);
insert into general_config values('multiport_syslogtcp_Source','eventSize','Event Size','Maximum size of a single event line, in bytes.',false,'2500','text',true);
insert into general_config values('multiport_syslogtcp_Source','keepFields','Keep Fields','Setting this to "all" will preserve the Priority, Timestamp and Hostname in the body of the event. A spaced separated list of fields to include is allowed as well. Currently, the following fields can be included: priority, version, timestamp, hostname. The values "true" and "false" have been deprecated in favor of "all" and "none".',false,'none','text',true);
insert into general_config values('multiport_syslogtcp_Source','portHeader','Port Header','If specified, the port number will be stored in the header of each event using the header name specified here. This allows for interceptors and channel selectors to customize routing logic based on the incoming port.',false,null,'text',true);
insert into general_config values('multiport_syslogtcp_Source','charset.default','Charset Default','Default character set used while parsing syslog events into strings.',false,'UTF-8','text',true);
insert into general_config values('multiport_syslogtcp_Source','charset.port.<port>','Charset Port <port>','Character set is configurable on a per-port basis.',false,null,'text',true);
insert into general_config values('multiport_syslogtcp_Source','batchSize','Batch Size','Maximum number of events to attempt to process per request loop. Using the default is usually fine.',false,'100','text',true);
insert into general_config values('multiport_syslogtcp_Source','readBufferSize','Read Buffer Size','Size of the internal Mina read buffer. Provided for performance tuning. Using the default is usually fine.',false,'1024','text',true);
insert into general_config values('multiport_syslogtcp_Source','numProcessors','Num Processors','Number of processors available on the system for use while processing messages. Default is to auto-detect # of CPUs using the Java Runtime API. Mina will spawn 2 request-processing threads per detected CPU, which is often reasonable.',false,'(auto-detected)','text',true);
insert into general_config values('multiport_syslogtcp_Source','selector.type','Selector.type','replicating, multiplexing, or custom',false,'replicating','text',true);
insert into general_config values('multiport_syslogtcp_Source','selector.*','Selector.*','Depends on the selector.type value',false,null,'text',true);
insert into general_config values('multiport_syslogtcp_Source','interceptors','Interceptors','Space-separated list of interceptors.',false,null,'text',true);
insert into general_config values('multiport_syslogtcp_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);

# Properties associated with Syslog UDP Source

insert into general_config values('syslogudp_Source','host','Host','Host name or IP address to bind to',true,'localhost','text',true);
insert into general_config values('syslogudp_Source','port','Port','Port # to bind to',true,'8080','text',true);
insert into general_config values('syslogudp_Source','keepFields','Keep Fields','Setting this to true will preserve the Priority, Timestamp and Hostname in the body of the event.',false,'FALSE','text',true);
insert into general_config values('syslogudp_Source','selector.type','Selector.type','replicating or multiplexing',false,null,'text',true);
insert into general_config values('syslogudp_Source','selector.*','Selector.*','Depends on the selector.type value',false,'replicating','text',true);
insert into general_config values('syslogudp_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('syslogudp_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);



# Properties associated with http Source

insert into general_config values('http_Source','port','Port','The port the source should bind to.',true,'8080','text',true);
insert into general_config values('http_Source','bind','Bind','The hostname or IP address to listen on',false,'0.0.0.0','text',true);
insert into general_config values('http_Source','handler','Handler','The FQCN of the handler class.',false,'org.apache.flume.source.http.JSONHandler','text',true);
insert into general_config values('http_Source','handler.*','Handler.*','Config parameters for the handler',false,null,'text',true);
insert into general_config values('http_Source','selector.type','Selector Type','replicating or multiplexing',false,'replicating','text',true);
insert into general_config values('http_Source','selector.*','Selector.*','Depends on the selector.type value',false,null,'text',true);
insert into general_config values('http_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('http_Source','interceptors.*','Interceptors.*','Interceptors',false,null,'text',true);
insert into general_config values('http_Source','enableSSL','Enable SSL','Set the property true, to enable SSL. HTTP Source does not support SSLv3.',false,'FALSE','text',true);
insert into general_config values('http_Source','excludeProtocols','Exclude Protocols','Space-separated list of SSL/TLS protocols to exclude. SSLv3 is always excluded.',false,'SSLv3','text',true);
insert into general_config values('http_Source','keystore','Key store','Location of the keystore includng keystore file name',false,null,'text',true);
insert into general_config values('http_Source','keystorePassword','Keystore password','Keystore password',false,'Keystore password','text',true);


# Properties associated with Stress Source

insert into general_config values('org.apache.flume.source.StressSource_Source','size','Size','Payload size of each Event. Unit:byte',false,'500','text',true);
insert into general_config values('org.apache.flume.source.StressSource_Source','maxTotalEvents','Max Total Events','Maximum number of Events to be sent',false,'-1','text',true);
insert into general_config values('org.apache.flume.source.StressSource_Source','maxSuccessfulEvents','Max Successful Events','Maximum number of Events successfully sent',false,'-1','text',true);
insert into general_config values('org.apache.flume.source.StressSource_Source','batchSize','Batch Size','Number of Events to be sent in one batch',false,'1','text',true);

# Properties associated with avro legacy Source

insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','host','Host','The hostname or IP address to bind to',true,'localhost','text',true);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','port','Port','The port # to listen on',true,'8080','text',true);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','selector.type','Selector Type','replicating or multiplexing',false,null,'text',true);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','selector.*','Selector.*','Depends on the selector.type value',false,'replicating','text',true);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('org.apache.flume.source.avroLegacy.AvroLegacySource_Source','interceptors.*','interceptors.*','Interceptors',false,null,'text',true);

# Properties associated with thrift legacy Source

insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','host','Host','The hostname or IP address to bind to',true,'localhost','text',true);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','port','Port','The port # to listen on',true,'8080','text',true);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','selector.type','Selector Type','replicating or multiplexing',false,null,'text',true);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','selector.*','Selector.*','Depends on the selector.type value',false,'replicating','text',true);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','interceptors','Interceptors','Space-separated list of interceptors',false,null,'text',true);
insert into general_config values('org.apache.flume.source.thriftLegacy.ThriftLegacySource_Source','interceptors.*','interceptors.*','Interceptors',false,null,'text',true);



# Properties associated with scribe Source

insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','port','Port','Port that Scribe should be connected',false,'1499','text',true);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','maxReadBufferBytes','Max Read Buffer Bytes','Thrift Default FrameBuffer Size',false,'16384000','text',true);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','workerThreads','Worker Threads','Handing threads number in Thrift',false,'5','text',true);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','selector.type','Selector.type','Selector Type',false,null,'text',true);
insert into general_config values('org.apache.flume.source.scribe.ScribeSource_Source','selector.*','Selector.*','Selectors',false,null,'text',true);

# Properties for md-config.xml file

INSERT INTO general_config VALUES ('mdconfig', 'status-notification.initial-context-factory', 'Active MQ Initial Context Factory', 'MQ notification factory for status notification', true, 'org.apache.activemq.jndi.ActiveMQInitialContextFactory', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'status-notification.provider-url', 'Notification Provider URL', 'MQ server address for status notification', true, 'tcp://localhost:61616', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'status-notification.halt-queue', 'Halt Queue', 'Halt Queue info for status notification', true, 'Success', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'status-notification.term-queue', 'Term Queue', 'Term Queue info for status notification', true, 'Failure', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'deploy.script-path', 'Deployment script path', 'Deployment script path', true, 'BDRE/jack/installer/guestfiles/deploy/process-type-', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'execute.log-path', 'Log File Location', 'Path for log file', true, '/var/log/BDRE/logfile-', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'execute.oozie-script-path', 'Oozie Script Path', 'Oozie workflow script path', true, '/home/cloudera/Workflow.py', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'execute.standalone-script-path', 'Flume Script Path', 'Flume script path for standalone purpose', true, '/home/cloudera/flume.sh', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'execute.rest-exec-url', 'Execute URL', 'URL where your execute jetty server is running', true, 'http://localhost:7777/execute/', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'upload.base-directory', 'Base Directory For Upload', 'Base Directory where you want to upload jars and hqls', true, 'target', 'text', true);
INSERT INTO general_config VALUES ('mdconfig', 'r.shell-script', 'Location of R shell script', 'Location of R shell script', '1', '/tmp/Rhadoop.sh', 'text', '1');

# Properties for im-config.xml file

INSERT INTO  general_config  VALUES ('imconfig', 'common.default-fs-name', 'Default file system name','Default file system name',true, 'hdfs://localhost:8020', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.hive-connection', 'URL of Hive connection','URL of Hive connection',true, 'jdbc:hive2://localhost:10000', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.hdfs-raw-directory', 'Hadoop raw directory','Hadoop raw directory' ,true, '/raw', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.hive-metastore-uris', 'URL of Hive metastore','URL of Hive metastore',true, 'thrift://localhost:9083', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'etl.local-download-directory', 'Directory to store downloaded files','Directory to store downloaded files',true, '/home/user/Downloads', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.thread-wait', 'Thread waiting time','Thread waiting time',true, '500', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.dirs', 'Monitoring file\'s directory list','Monitoring file\'s directory list',true, '/home/cloudera/oozies,/home/cloudera/datasets', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.filter', 'Filter Information','Filter Information',true, 'merchant\\s[0-9],test\\s[0-9]', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.sub-processIds', 'Sub process IDs','Sub process IDs',true, '1,2', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'file-mon.serverIds', 'Server IDs','Server IDs',true, '100,200', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'dq.drools-url-prefix', 'URL prefix for drools','URL prefix for drools',true, 'http://localhost:8080/guvnor56/rest/packages/', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'data-import.hadoop-home', 'Hadoop home directory for exporting','Hadoop home directory for exporting',true, '/usr/lib/hadoop', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'data-import.target-dir', 'Target direcotry to store imported data','Target direcotry to store imported data',true, 'hdfs://localhost:8020/user/dropuser/import', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'data-import.jar-output-dir', 'Jar output directory for importing','Jar output directory for importing',true, '/home/cloudera/outputdir/jar-output', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'mq-import.file-size-units', 'File size\'s unit','File size\'s unit',true, 'KB', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'mq-import.rotation-file-size', 'Rotation file size','Rotation file size',true, '10', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'mq-import.target-directory', 'Directory to import MQ file','Directory to import MQ file',true, 'hdfs://localhost:8020/user/dropuser/mq-import', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'data-export.hadoop-home', 'Hadoop home directory for exporting','Hadoop home directory for exporting',true, '/usr/lib/hadoop', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'data-export.jar-output-dir', 'Jar output directory for exporting','Jar output directory for exporting',true, '/home/cloudera/outputdir/jar-output', 'text', true);
INSERT INTO  general_config  VALUES ('imconfig', 'eventing.metadata-broker-list', 'Metadata Broker\'s URL','Metadata Broker\'s URL',true, 'localhost://:9092', 'text', true);

-- Populating crawler process
insert into general_config values ('crawler','numberOfMappers','no of mappers','Number of Mappers',true,'2','text',true);
insert into general_config values ('crawler','politenessDelay','Politeness Delay','Politeness Delay',true,'200','text',true);
insert into general_config values ('crawler','maxDepthOfCrawling','max depth of crawling','Max Depth of Crawling',true,'10','text',true);
insert into general_config values ('crawler','maxPagesToFetch','max pages to fetch','Max Pages to Fetch',true,'5','text',true);
insert into general_config values ('crawler','includeBinaryContentInCrawling','binary content in crawling','To Include binary content in crawling',true,'false','text',true);
insert into general_config values ('crawler','resumableCrawling','Resumable crawling','Resumable crawling',true,'false','text',true);
insert into general_config values ('crawler','userAgentString','user agent string','User Agent String',true,'Mozilla/123.0 (Windows NT 6.1) AppleWebKit/12337.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/12337.36','text',true);
insert into general_config values ('crawler','proxyHost','proxy host','Proxy Host',true,'null','text',true);
insert into general_config values ('crawler','proxyPort','proxy port','Proxy Port',true,'null','text',true);
insert into general_config values ('crawler','proxyUsername','Proxy Username','proxy username',true,'null','text',true);
insert into general_config values ('crawler','proxyPassword','Proxy Password','proxy password',true,'null','text',true);
insert into general_config values ('crawler','url','url','urls to crawl',true,'https://www.dmoz.org,https://www.zomato.com/mumbai','text',true);
insert into general_config values ('crawler','urlsToSearch','urls to search','urls to search',true,'.*','text',true);
insert into general_config values ('crawler','urlsNotToSearch','urls not to search','urls not to search',true,'.*\\\\.(bmp|gif|jpg|png)$','text',true);









-- Populating sample semantic process

-- process entries for a sample semantic job


Insert into process  values (10802,'BANK Core Workflow1 For India',current_timestamp,'BANK_CORE_IN_WF_1',1,2,null, 0,0,null,'10805,10806', 0,1,0,current_timestamp);
Insert into process  values (10806,'BANK_CORE_CUST_JOINT_INDVL_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_CUST_JOINT_INDVL_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10807,10808,10809,10810,10811,10812,10813', 0,0,0,current_timestamp);
Insert into process  values (10807,'BANK_CORE_SS_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_SS_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10808,'BANK_CORE_DD_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_DD_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10809,'BANK_CORE_CP_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_CP_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10810,'BANK_CORE_LS_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_LS_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10811,'BANK_CORE_PL_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_PL_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10812,'BANK_CORE_TC_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_TC_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10813,'BANK_CORE_TD_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_TD_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10814', 0,0,0,current_timestamp);
Insert into process  values (10814,'BANK_CORE_COMMON_J_I_JOIN',current_timestamp,'BANK_CORE_COMMON_J_I_JOIN',1,9,10802, 0,0,null,'10815,10816,10817,10818,10819,10820,10821,10822,10823,10824,10825,10826,10827,10828', 0,0,0,current_timestamp);
Insert into process  values (10815,'BANK_HUB_006_SS_CP_J',current_timestamp,'BANK_HUB_006_SS_CP_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10816,'BANK_HUB_014_SS_TD_J',current_timestamp,'BANK_HUB_014_SS_TD_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10817,'BANK_HUB_004_SS_DD_J',current_timestamp,'BANK_HUB_004_SS_DD_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10818,'BANK_HUB_010_SS_PL_J',current_timestamp,'BANK_HUB_010_SS_PL_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10819,'BANK_HUB_012_SS_TC_J',current_timestamp,'BANK_HUB_012_SS_TC_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10820,'BANK_HUB_008_SS_LS_J',current_timestamp,'BANK_HUB_008_SS_LS_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10821,'BANK_HUB_002_SS_SS_J',current_timestamp,'BANK_HUB_002_SS_SS_J',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10822,'BANK_HUB_006_SS_CP_I',current_timestamp,'BANK_HUB_006_SS_CP_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10823,'BANK_HUB_014_SS_TD_I',current_timestamp,'BANK_HUB_014_SS_TD_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10824,'BANK_HUB_004_SS_DD_I',current_timestamp,'BANK_HUB_004_SS_DD_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10825,'BANK_HUB_010_SS_PL_I',current_timestamp,'BANK_HUB_010_SS_PL_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10826,'BANK_HUB_012_SS_TC_I',current_timestamp,'BANK_HUB_012_SS_TC_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10827,'BANK_HUB_008_SS_LS_I',current_timestamp,'BANK_HUB_008_SS_LS_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10828,'BANK_HUB_002_SS_SS_I',current_timestamp,'BANK_HUB_002_SS_SS_I',1,9,10802, 0,0,null,'10829', 0,0,0,current_timestamp);
Insert into process  values (10829,'BANK_CORE_COMMON_FF_CREATE',current_timestamp,'BANK_CORE_COMMON_FF_CREATE',1,9,10802, 0,0,null,'10830', 0,0,0,current_timestamp);
Insert into process  values (10830,'BANK_HUB_020_LOB_SSGHCGP',current_timestamp,'BANK_HUB_020_LOB_SSGHCGP',1,9,10802, 0,0,null,'10831', 0,0,0,current_timestamp);
Insert into process  values (10831,'BANK_HUB_018_EXTREF_SSEANFP',current_timestamp,'BANK_HUB_018_EXTREF_SSEANFP',1,9,10802, 0,0,null,'10832', 0,0,0,current_timestamp);
Insert into process  values (10832,'BANK_HUB_016_F_C',current_timestamp,'BANK_HUB_016_F_C',1,9,10802, 0,0,null,'10833', 0,0,0,current_timestamp);
Insert into process  values (10833,'BANK_HUB_015_F_N_C',current_timestamp,'BANK_HUB_015_F_N_C',1,9,10802, 0,0,null,'10834', 0,0,0,current_timestamp);
Insert into process  values (10834,'BANK_HUB_019_EXTREF_EUSSCMP',current_timestamp,'BANK_HUB_019_EXTREF_EUSSCMP',1,9,10802, 0,0,null,'10835', 0,0,0,current_timestamp);
Insert into process  values (10835,'BANK_HUB_021_IBAN_DDIBANP',current_timestamp,'BANK_HUB_021_IBAN_DDIBANP',1,9,10802, 0,0,null,'10802', 0,0,0,current_timestamp);
Insert into process  values (10805,'BANK_CORE_CUST_INDVL_JOINT_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_CUST_INDVL_JOINT_ACCT_JOIN_OPTIM',1,9,10802, 0,0,null,'10807,10808,10809,10810,10811,10812,10813', 0,0,0,current_timestamp);





--populating process for postgres



-- Populating sample semantic process

-- process entries for a sample semantic job


Insert into process  values (10802,'BANK Core Workflow1 For India',current_timestamp,'BANK_CORE_IN_WF_1',1,2,null,false,0,null,'10805,10806',false,1,0,null);
Insert into process  values (10806,'BANK_CORE_CUST_JOINT_INDVL_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_CUST_JOINT_INDVL_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10807,10808,10809,10810,10811,10812,10813',false,0,0,null););
Insert into process  values (10807,'BANK_CORE_SS_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_SS_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10808,'BANK_CORE_DD_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_DD_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10809,'BANK_CORE_CP_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_CP_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10810,'BANK_CORE_LS_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_LS_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10811,'BANK_CORE_PL_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_PL_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10812,'BANK_CORE_TC_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_TC_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10813,'BANK_CORE_TD_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_TD_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10814',false,0,0,null);
Insert into process  values (10814,'BANK_CORE_COMMON_J_I_JOIN',current_timestamp,'BANK_CORE_COMMON_J_I_JOIN',1,9,10802,false,0,null,'10815,10816,10817,10818,10819,10820,10821,10822,10823,10824,10825,10826,10827,10828',false,0,0,null);
Insert into process  values (10815,'BANK_HUB_006_SS_CP_J',current_timestamp,'BANK_HUB_006_SS_CP_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10816,'BANK_HUB_014_SS_TD_J',current_timestamp,'BANK_HUB_014_SS_TD_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10817,'BANK_HUB_004_SS_DD_J',current_timestamp,'BANK_HUB_004_SS_DD_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10818,'BANK_HUB_010_SS_PL_J',current_timestamp,'BANK_HUB_010_SS_PL_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10819,'BANK_HUB_012_SS_TC_J',current_timestamp,'BANK_HUB_012_SS_TC_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10820,'BANK_HUB_008_SS_LS_J',current_timestamp,'BANK_HUB_008_SS_LS_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10821,'BANK_HUB_002_SS_SS_J',current_timestamp,'BANK_HUB_002_SS_SS_J',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10822,'BANK_HUB_006_SS_CP_I',current_timestamp,'BANK_HUB_006_SS_CP_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10823,'BANK_HUB_014_SS_TD_I',current_timestamp,'BANK_HUB_014_SS_TD_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10824,'BANK_HUB_004_SS_DD_I',current_timestamp,'BANK_HUB_004_SS_DD_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10825,'BANK_HUB_010_SS_PL_I',current_timestamp,'BANK_HUB_010_SS_PL_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10826,'BANK_HUB_012_SS_TC_I',current_timestamp,'BANK_HUB_012_SS_TC_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10827,'BANK_HUB_008_SS_LS_I',current_timestamp,'BANK_HUB_008_SS_LS_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10828,'BANK_HUB_002_SS_SS_I',current_timestamp,'BANK_HUB_002_SS_SS_I',1,9,10802,false,0,null,'10829',false,0,0,null);
Insert into process  values (10829,'BANK_CORE_COMMON_FF_CREATE',current_timestamp,'BANK_CORE_COMMON_FF_CREATE',1,9,10802,false,0,null,'10830',false,0,0,null);
Insert into process  values (10830,'BANK_HUB_020_LOB_SSGHCGP',current_timestamp,'BANK_HUB_020_LOB_SSGHCGP',1,9,10802,false,0,null,'10831',false,0,0,null);
Insert into process  values (10831,'BANK_HUB_018_EXTREF_SSEANFP',current_timestamp,'BANK_HUB_018_EXTREF_SSEANFP',1,9,10802,false,0,null,'10832',false,0,0,null);
Insert into process  values (10832,'BANK_HUB_016_F_C',current_timestamp,'BANK_HUB_016_F_C',1,9,10802,false,0,null,'10833',false,0,0,null);
Insert into process  values (10833,'BANK_HUB_015_F_N_C',current_timestamp,'BANK_HUB_015_F_N_C',1,9,10802,false,0,null,'10834',false,0,0,null);
Insert into process  values (10834,'BANK_HUB_019_EXTREF_EUSSCMP',current_timestamp,'BANK_HUB_019_EXTREF_EUSSCMP',1,9,10802,false,0,null,'10835',false,0,0,null);
Insert into process  values (10835,'BANK_HUB_021_IBAN_DDIBANP',current_timestamp,'BANK_HUB_021_IBAN_DDIBANP',1,9,10802,false,0,null,'10802',false,0,0,null);
Insert into process  values (10805,'BANK_CORE_CUST_INDVL_JOINT_ACCT_JOIN_OPTIM',current_timestamp,'BANK_CORE_CUST_INDVL_JOINT_ACCT_JOIN_OPTIM',1,9,10802,false,0,null,'10807,10808,10809,10810,10811,10812,10813',false,0,0,null);



















-- properties for the semantic job defined above

Insert into properties  values (10811,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10808,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10808,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10808,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10808,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10808,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10808,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10808,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10808,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10808,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10809,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10809,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10809,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10809,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10809,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10809,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10809,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10809,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10809,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10809,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10809,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10809,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10809,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10809,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10809,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10809,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10809,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10809,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10809,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10809,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10810,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10810,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10810,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10810,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10810,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10810,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10810,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10810,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10810,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10810,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10810,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10810,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10810,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10810,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10810,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10810,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10810,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10810,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10810,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10810,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10811,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10811,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10811,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10811,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10811,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10811,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10811,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10811,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10811,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10811,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10811,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10811,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10811,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10811,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10811,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10811,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10811,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10811,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10811,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10812,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10812,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10812,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10812,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10812,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10812,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10812,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10812,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10812,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10812,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10812,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10812,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10812,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10812,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10812,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10812,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10812,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10812,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10812,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10812,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10813,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10813,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10813,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10813,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10813,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10813,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10813,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10813,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10813,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10813,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10813,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10813,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10813,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10813,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10813,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10813,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10813,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10813,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10813,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10813,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10814,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10814,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10814,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10814,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10814,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10814,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10814,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10814,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10814,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10814,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10814,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10814,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10814,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10814,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10814,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10814,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10814,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10814,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10821,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10814,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10814,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10815,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10815,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10815,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10815,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10815,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10815,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10815,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10815,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10815,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10815,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10815,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10815,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10815,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10815,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10815,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10815,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10815,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10815,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10815,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10815,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10816,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10816,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10816,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10816,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10816,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10816,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10816,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10816,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10816,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10816,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10816,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10816,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10816,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10816,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10816,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10816,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10816,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10816,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10816,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10816,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10817,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10817,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10817,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10817,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10817,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10817,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10817,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10817,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10817,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10817,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10817,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10817,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10817,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10817,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10817,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10817,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10817,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10817,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10817,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10817,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10818,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10818,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10818,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10818,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10818,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10818,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10818,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10818,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10818,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10818,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10818,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10818,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10818,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10818,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10818,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10818,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10818,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10818,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10818,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10818,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10819,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10819,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10819,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10819,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10819,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10819,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10819,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10819,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10819,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10819,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10819,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10819,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10819,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10819,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10819,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10819,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10819,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10819,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10819,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10819,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10820,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10820,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10820,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10820,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10820,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10820,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10820,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10820,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10820,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10820,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10820,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10820,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10820,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10820,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10820,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10820,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10820,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10820,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10820,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10820,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10821,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10821,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10821,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10821,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10821,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10821,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10821,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10821,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10821,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10821,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10821,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10821,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10821,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10821,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10821,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10821,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10821,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10821,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10821,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10822,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10822,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10822,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10822,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10822,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10822,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10822,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10822,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10822,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10822,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10822,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10822,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10822,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10822,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10822,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10822,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10822,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10822,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10822,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10822,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10823,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10823,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10823,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10823,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10823,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10823,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10823,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10823,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10823,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10823,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10823,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10823,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10823,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10823,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10823,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10823,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10823,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10823,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10823,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10823,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10824,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10824,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10824,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10824,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10824,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10824,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10824,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10824,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10824,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10824,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10824,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10824,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10824,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10824,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10824,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10824,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10824,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10824,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10824,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10824,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10825,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10825,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10825,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10825,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10825,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10825,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10825,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10825,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10825,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10825,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10825,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10825,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10825,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10825,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10825,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10825,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10825,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10825,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10825,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10825,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10826,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10826,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10826,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10826,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10826,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10826,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10826,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10826,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10826,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10826,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10826,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10826,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10826,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10826,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10826,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10826,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10826,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10826,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10826,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10826,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10827,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10827,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10827,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10827,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10827,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10827,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10827,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10827,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10827,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10827,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10827,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10827,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10827,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10827,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10827,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10827,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10827,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10827,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10827,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10827,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10828,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10828,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10828,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10828,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10828,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10828,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10828,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10828,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10828,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10828,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10828,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10828,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10828,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10828,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10828,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10828,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10828,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10828,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10828,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10828,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10829,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10829,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10829,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10829,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10829,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10829,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10829,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10829,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10829,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10829,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10829,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10829,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10829,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10829,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10829,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10829,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10829,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10829,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10829,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10829,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10830,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10830,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10830,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10830,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10830,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10830,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10830,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10830,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10830,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10830,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10830,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10830,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10830,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10830,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10830,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10830,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10830,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10830,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10830,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10830,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10831,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10831,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10831,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10831,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10831,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10831,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10831,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10831,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10831,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10831,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10831,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10831,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10831,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10831,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10831,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10831,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10831,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10831,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10831,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10831,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10832,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10832,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10832,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10832,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10832,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10832,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10832,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10832,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10832,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10832,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10832,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10832,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10832,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10832,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10832,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10832,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10832,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10832,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10832,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10832,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10833,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10833,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10833,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10833,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10833,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10833,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10833,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10833,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10833,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10833,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10833,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10833,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10833,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10833,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10833,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10833,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10833,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10833,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10833,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10805,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10805,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10805,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10805,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10805,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10805,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10805,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10805,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10805,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10805,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10805,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10805,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10805,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10805,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10805,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10805,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10805,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10805,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10805,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10805,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10805,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_CUST_INDVL_JOINT_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10806,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_CUST_JOINT_INDVL_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10807,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_SS_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10808,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_DD_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10809,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_CP_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10810,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_LS_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10811,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_PL_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10812,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_TC_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10813,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_TD_ACCT_JOIN_OPTIM.hql','Path to core routine');
Insert into properties  values (10814,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_COMMON_J_I_JOIN.hql','Path to core routine');
Insert into properties  values (10815,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_006_SS_CP_J.hql','Path to core routine');
Insert into properties  values (10816,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_014_SS_TD_J.hql','Path to core routine');
Insert into properties  values (10817,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_004_SS_DD_J.hql','Path to core routine');
Insert into properties  values (10818,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_010_SS_PL_J.hql','Path to core routine');
Insert into properties  values (10819,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_012_SS_TC_J.hql','Path to core routine');
Insert into properties  values (10820,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_008_SS_LS_J.hql','Path to core routine');
Insert into properties  values (10821,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_002_SS_SS_J.hql','Path to core routine');
Insert into properties  values (10822,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_006_SS_CP_I.hql','Path to core routine');
Insert into properties  values (10823,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_014_SS_TD_I.hql','Path to core routine');
Insert into properties  values (10824,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_004_SS_DD_I.hql','Path to core routine');
Insert into properties  values (10825,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_010_SS_PL_I.hql','Path to core routine');
Insert into properties  values (10826,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_012_SS_TC_I.hql','Path to core routine');
Insert into properties  values (10827,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_008_SS_LS_I.hql','Path to core routine');
Insert into properties  values (10828,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_002_SS_SS_I.hql','Path to core routine');
Insert into properties  values (10829,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_CORE_COMMON_FF_CREATE.hql','Path to core routine');
Insert into properties  values (10830,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_020_LOB_SSGHCGP.hql','Path to core routine');
Insert into properties  values (10831,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_018_EXTREF_SSEANFP.hql','Path to core routine');
Insert into properties  values (10832,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_016_F_C.hql','Path to core routine');
Insert into properties  values (10833,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_015_F_N_C.hql','Path to core routine');
Insert into properties  values (10834,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_019_EXTREF_EUSSCMP.hql','Path to core routine');
Insert into properties  values (10835,'query','scriptPath','/user/abanerjee/BANK/hql/core/BANK_HUB_021_IBAN_DDIBANP.hql','Path to core routine');
Insert into properties  values (10806,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10806,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10806,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10806,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10806,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10806,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10806,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10806,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10806,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10806,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10806,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10806,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10806,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10806,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10806,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10806,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10806,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10806,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10806,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10806,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10807,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10807,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10807,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10807,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10807,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10807,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10807,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10807,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10807,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10807,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10807,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10807,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10807,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10807,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10807,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10807,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10807,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10807,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10807,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10807,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10808,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10808,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10808,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10808,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10808,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10808,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10808,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10808,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10808,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10808,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10808,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10833,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10834,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10834,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10834,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10834,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10834,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10834,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10834,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10834,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10834,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10834,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10834,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10834,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10834,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10834,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10834,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10834,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10834,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10834,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10834,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10834,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10835,'param','BANK_SOURCE_COUNTRY_DB','HUB_PROD_IN','NewDescription');
Insert into properties  values (10835,'param','BANK_INTERIM_COUNTRY_DB','BANK_IN','NewDescription');
Insert into properties  values (10835,'param','BANK_COMMON_DB','BANK_COMMON','NewDescription');
Insert into properties  values (10835,'param','BANK_COUNTRY_PARTITION','IN','NewDescription');
Insert into properties  values (10835,'param','BANK_INDVL_TABLE','SSCUSTP','NewDescription');
Insert into properties  values (10835,'param','BANK_JOINT_TABLE','SSPRJIP
','NewDescription');
Insert into properties  values (10835,'param','CUST_GROUP_TABLE','SSGHCGP','NewDescription');
Insert into properties  values (10835,'param','CUST_CLASSIFICATION_TABLE','SSGHCLP','NewDescription');
Insert into properties  values (10835,'param','SS_ACCOUNT_TABLE','SSACCPP','NewDescription');
Insert into properties  values (10835,'param','DD_ACCOUNT_TABLE','DDACMSP','NewDescription');
Insert into properties  values (10835,'param','CP_ACCOUNT_TABLE','CPACMCP','NewDescription');
Insert into properties  values (10835,'param','LS_ACCOUNT_TABLE','LSACMSP','NewDescription');
Insert into properties  values (10835,'param','PL_ACCOUNT_TABLE','PLACMSP','NewDescription');
Insert into properties  values (10835,'param','TC_ACCOUNT_TABLE','TCACMSP','NewDescription');
Insert into properties  values (10835,'param','TD_ACCOUNT_TABLE','TDACMSP','NewDescription');
Insert into properties  values (10835,'param','EXT_ACCT_FIELDS_TABLE','SSEANFP','NewDescription');
Insert into properties  values (10835,'param','CORPORATE_FATCA_LOB_TABLE','SSINCIP','NewDescription');
Insert into properties  values (10835,'param','NON_CORPORATE_FATCA_LOB_TABLE','SSICADP','NewDescription');
Insert into properties  values (10835,'param','EU_ACCT_FIELDS_TABLE','EUSSCMP','NewDescription');
Insert into properties  values (10835,'param','IBAN_ACCT_FIELDS_TABLE','DDIBANP','NewDescription');
Insert into properties  values (10802,'security','secure', 1,'Secure BANKster Indicator');
Insert into properties  values (10802,'credential','key1','val2','credentialprop1');

INSERT INTO users(username,password,enabled)
VALUES ('admin','26952954eb652c3e797cf74b8e7b29bc9f447212',  1);
INSERT INTO users(username,password,enabled)
VALUES ('user1','090fdff55a94e1721a7936fad5fdbd8ae9ed2d04',  1);



-- populating users for postgres

INSERT INTO users(username,password,enabled)
VALUES ('admin','26952954eb652c3e797cf74b8e7b29bc9f447212',  true);
INSERT INTO users(username,password,enabled)
VALUES ('user1','090fdff55a94e1721a7936fad5fdbd8ae9ed2d04',  true);





INSERT INTO user_roles (USER_ROLE_ID,username, ROLE)
VALUES (1,'user1', 'ROLE_USER');
INSERT INTO user_roles (USER_ROLE_ID,username, ROLE)
VALUES (2,'admin', 'ROLE_ADMIN');

commit;