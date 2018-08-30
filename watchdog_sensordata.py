###################################################################################
####################### Developed by Daniele Salvigni for ######################### 
###################################################################################

import sys
import time
import datetime
import logging
import mysql.connector
from mysql.connector import errorcode
from watchdog.observers import Observer
from watchdog.events import LoggingEventHandler
import os



class CustomLoggingEventHandler(LoggingEventHandler):
    '''Logs all creation events captured.'''

    def process(self, event):
     self.logger = logger
     filename = event.src_path.replace(path,'')
     dbname = 'konux_sdi'
	 #To be modified
     loadpath = "'C://project//python//..//DATA//"
	 #Connection string to MariaDB
     cnx = mysql.connector.connect(user='root',password='n00b',database=dbname)
     logger.info('Connected to: DB '+dbname+' on -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
     print('Connected to: DB '+dbname+' on ->'+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
     if 'GYR' in filename:
       time.sleep(1)
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile "+loadpath+filename+"' into table konux_sdi.konux_gyroscope fields terminated by '|' lines terminated by ';'"
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
       time.sleep(1)
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile "+loadpath+filename+"' into table konux_sdi.konux_accelerometer_z fields terminated by '|' lines terminated by ';'"
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
       time.sleep(1)
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile "+loadpath+filename+"' into table konux_sdi.konux_accelerometer_y fields terminated by '|' lines terminated by ';'"
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
       time.sleep(1)
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile "+loadpath+filename+"' into table konux_sdi.konux_battery fields terminated by '|' lines terminated by ';'"
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
       time.sleep(1)
       logger.info('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M')))
       print('New file arrived -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)
       query =" load data local infile "+loadpath+filename+"' into table konux_sdi.konux_temperature fields terminated by '|' lines terminated by ';'"
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
	   
	#I implemented 2 events handler: every time a file is generated in the director or modified (overwritten)
	#Watchdog catch it and we start the massive upload	
    def on_created(self, event):
     self.process(event)
     #self.logger.info('New creation event rised -> '+str(datetime.datetime.now().strftime('%d_%m_%Y_%H-%M'))+' - '+event.src_path)


if __name__ == "__main__":
	#I set my absolute path to the DATA folder. This is necessary to format correctly the filename
    path ="C:\\project\\python\\DATA\\"
	#We define the LOG file
    logging.basicConfig(level=logging.INFO, format='%(asctime)s: %(levelname)-8s: %(message)s',datefmt='%d_%m_%Y_%H-%M',filename='data.log')
    logger = logging.getLogger('data')
	#Alternatively to the absolute path can be provided the path by console. 
	#I preferred to implement the absolute path setup in the code to force looking in this file.
    #path = sys.argv[1] if len(sys.argv) > 1 else '.'
    event_handler = CustomLoggingEventHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=False)
    observer.start()
    print('-------------------- event handler ---------------------')
    print('Started on -> '+str(datetime.datetime.now().strftime("%d\%m\%Y-%H:%M")))
    print('Watchdog Log Activity started on folder -> '+str(path))
    print('Written by Daniele Salvigni')
    print('')
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
