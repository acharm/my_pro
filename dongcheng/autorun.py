# -*- coding: utf-8 -*-
import cx_Oracle
import urllib2
import json
import string

# about this script function: fetch coordinate_x and coordinate_y from table,
# provide them as url to get damn_result(community_name)
# update damn_result into table
global start_time
start_time = ""
global url_conf
###--------------- config data -----------------#############################
from_tab_up = "from dldata.tostatinfo"
sql_from = " select eventid, coordinatex, coordinatey "+from_tab_up+" WHERE LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') and sqname2_new is null " 
url_conf = 'http://172.25.65.21:8680/geoserver/wfs?request=GetFeature&version=1.0.0&typeName=communitynew_region&BBOX='  
#############################################################################

def validate_flag():
    global start_time
    conn = cx_Oracle.connect('dlsys/dlsys@172.25.65.21/SJFX')
    cs = conn.cursor()
    def my_close():
        cs.close()
        conn.close()
    cs.execute("select stat_flag, last_date from dldata.tostatinfo_updateflag where rownum = 1")
    flag_row = cs.fetchone()
    if flag_row == None:
        my_close()
        return False
    elif flag_row[0] == 0:
        my_close()
        return False
    elif flag_row[0] == 1:
        start_time = str(flag_row[1])
        my_close()
        return True

def update_data():
    global url_conf
    global start_time
    print "from time:"+start_time
    print ""
    sql_from = " select eventid, coordinatex, coordinatey "+from_tab_up+" WHERE LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') and sqname2_new is null "
    conn = cx_Oracle.connect('dlsys/dlsys@172.25.65.21/SJFX')
    cursor1 = conn.cursor()
    cursor2 = conn.cursor()    
    cursor1.execute(sql_from)
    while (1):
        row = cursor1.fetchone()
        if row == None:
            break
        print "eventid: " + str(row[0]) + " -- coordinatex: " + str(row[1]) + " -- coordinatey: " + str(row[2])
        if row[1] == None or row[2] == None :
            sql_to1 = " update dldata.tostatinfo set sqname2_new = '"+"' where eventid = "+str(row[0])+" and sqname2_new is null and LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') "
            sql_to2 = " update dldata.tostatinfowmcq set sqname2_new = '"+"' where eventid = "+str(row[0])+" and sqname2_new is null and LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') "
            print sql_to1
            print sql_to2
            cursor2.execute(sql_to1)
            cursor2.execute(sql_to2)
            cursor2.execute("commit")
            continue
        url = url_conf+str(row[1])+'%2C'+str(row[2])+'%2C'+str(row[1])+'%2C'+str(row[2])+'&outputformat=json'
        print url
        re = urllib2.urlopen(url).read()
        features = json.loads(re)['features']
        len_fea = len(features)
        if len_fea < 1 :
            print "features' length : " + str(len_fea)
            sql_to1 = " update dldata.tostatinfo set sqname2_new = '"+"' where eventid = "+str(row[0])+" and sqname2_new is null and LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') "
            sql_to2 = " update dldata.tostatinfowmcq set sqname2_new = '"+"' where eventid = "+str(row[0])+" and sqname2_new is null and LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') "
            print sql_to1
            print sql_to2
            cursor2.execute(sql_to1)
            cursor2.execute(sql_to2)
            cursor2.execute("commit")
            continue
        else :
            print "features' length : " + str(len_fea)
            damn_result = features[0]['properties']['SQNAME2']
            sql_to1 = " update dldata.tostatinfo set sqname2_new = '"+damn_result+"' where eventid = "+str(row[0])+" and sqname2_new is null and LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') "
            sql_to2 = " update dldata.tostatinfowmcq set sqname2_new = '"+damn_result+"' where eventid = "+str(row[0])+" and sqname2_new is null and LAST_UPDATE_TIME >= to_date('"+start_time+"', 'yyyy-MM-dd hh24:mi:ss') "
            print sql_to1
            print sql_to2
            cursor2.execute(sql_to1)
            cursor2.execute(sql_to2)
            cursor2.execute("commit")
        print "-----------------------------------------------------------------"
    cursor2.close()
    cursor1.close()
    conn.close()

def change_flag():
    conn = cx_Oracle.connect('dlsys/dlsys@172.25.65.21/SJFX')
    cs = conn.cursor()
    cs.execute(" update dldata.tostatinfo_updateflag set stat_flag = 0 ")
    cs.execute("commit");
    cs.close()
    conn.close()
    print "has changed flag"

if validate_flag():
    print "start update data..."
    update_data()
    change_flag()
else:
    print "------no need to update-------------------------------"
    





