###################################################################################
######################Developed by Daniele Salvigni for KONUX###################### 
###################################################################################

import sys
import time
import datetime
import logging
import mysql.connector
from mysql.connector import errorcode
from watchdog.observers import Observer
from watchdog.events import LoggingEventHandler



class CustomLoggingEventHandler(LoggingEventHandler):
    '''Logs all creation events captured.'''

    def process(self, event):
     self.logger = logger
     filename = event.src_path.replace(path,'')
     dbname = 'konux_sdi'
	 #Connection string to MariaDB
     cnx = mysql.connector.connect(user='root',password='n00b',database=dbname)
     logger.info('Connected to: DB '+dbname+' on -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
     print('Connected to: DB '+dbname+' on ->'+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
	 #Path where are automatically loaded the generated datafile. Of course it could be a mapped network folder
     path_for_load = C://project//python//konux//DATA//
	 #Upload of the data with watchdog multithread event handler
	 #Files have a simple structure: PlatID (unic per switch component), value and time stamp. All loaded in 5 different tables (Sensors)
	 #The commit is enclosed ina try/catch and all the action are logged in a dedicatd DATA_LOG file in the root of the folder
     if 'GYR' in filename:
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile '"+path_for_load+filename+"' into table konux_sdi.konux_gyroscope fields terminated by '|' lines terminated by ';'"
       cursor = cnx.cursor()
       try:
        cursor.execute(query)
        cnx.commit()
        logger.info('Loaded file ->'+filename+' at -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
        print('Loaded in DB -> '+filename)
       except(TypeError):
        logger.info('Error in  file: '+filename+'-> '+str(TypeError))
        print('Error in  file: '+filename+'-> '+str(TypeError))
        pass
       cnx.close()
       print('Disconnected from -> '+dbname)
     if 'ACCZ' in filename:
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile '"+path_for_load+filename+"' into table konux_sdi.konux_accelerometer_z fields terminated by '|' lines terminated by ';'"
       cursor = cnx.cursor()
       try:
        cursor.execute(query)
        cnx.commit()
        logger.info('Loaded file ->'+filename+' at -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
        print('Loaded in DB -> '+filename)
       except(TypeError):
        logger.info('Error in  file: '+filename+'-> '+str(TypeError))
        print('Error in  file: '+filename+'-> '+str(TypeError))
        pass
       cnx.close()
       print('Disconnected from -> '+dbname)
     if 'ACCY' in filename:
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile '"+path_for_load+filename+"' into table konux_sdi.konux_accelerometer_y fields terminated by '|' lines terminated by ';'"
       cursor = cnx.cursor()
       try:
        cursor.execute(query)
        cnx.commit()
        logger.info('Loaded file ->'+filename+' at -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
        print('Loaded in DB -> '+filename)
       except(TypeError):
        logger.info('Error in  file: '+filename+'-> '+str(TypeError))
        print('Error in  file: '+filename+'-> '+str(TypeError))
        pass
       cnx.close()
       print('Disconnected from -> '+dbname)
     if 'BAT' in filename:
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile '"+path_for_load+filename+"' into table konux_sdi.konux_battery fields terminated by '|' lines terminated by ';'"
       cursor = cnx.cursor()
       try:
        cursor.execute(query)
        cnx.commit()
        logger.info('Loaded file ->'+filename+' at -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
        print('Loaded in DB -> '+filename)
       except(TypeError):
        logger.info('Error in  file: '+filename+'-> '+str(TypeError))
        print('Error in  file: '+filename+'-> '+str(TypeError))
        pass
       cnx.close()
       print('Disconnected from -> '+dbname)
     if 'TEM' in filename:
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile '"+path_for_load+filename+"' into table konux_sdi.konux_temperature fields terminated by '|' lines terminated by ';'"
       cursor = cnx.cursor()
       try:
        cursor.execute(query)
        cnx.commit()
        logger.info('Loaded file ->'+filename+' at -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
        print('Loaded in DB -> '+filename)
       except(TypeError):
        logger.info('Error in  file: '+filename+'-> '+str(TypeError))
        print('Error in  file: '+filename+'-> '+str(TypeError))
        pass
       cnx.close()
       print('Disconnected from -> '+dbname)
	   
	#I implemented 1 handler: every time a file is generated in the directory Watchdog catch it and it starts the massive upload	
    def on_created(self, event):
     self.process(event)
	 #Line commented used for test.
     #self.logger.info('New creation event rised -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)


if __name__ == "__main__":
	#I set my absolute path to the DATA folder (The same as the path for data load but for charsets-interpretation reason 
	# I need to define one for SQL LOAD DATA command and one for the Observer.
    path ='C:\\project\\python\\konux\\DATA\\'
	#We define the LOG file
    logging.basicConfig(level=logging.INFO, format='%(asctime)s: %(levelname)-8s: %(message)s',datefmt='%d_%m_%Y_%H-%M',filename='KONUX_data.log')
    logger = logging.getLogger('KONUX_data')
	#The following commented line is an alternative to the absolute path, which can can be provided by console parameter. 
	#Syntax: python yourfile.py path ...
    #path = sys.argv[1] if len(sys.argv) > 1 else '.'
    event_handler = CustomLoggingEventHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=False)
    observer.start()
    print('---------------- KONUX evenst listener -----------------')
    print('Started on -> '+str(datetime.datetime.now().strftime("%d\%m\%Y-%H:%M")))
    print('Watchdog Log Activity started on folder -> '+str(path))
    print('Written by Daniele Salvigni')
    print('')
    try:
        while True:
            time.sleep(10)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()