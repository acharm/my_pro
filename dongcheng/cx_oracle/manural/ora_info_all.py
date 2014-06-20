# -*- coding: utf-8 -*-
import cx_Oracle
import urllib2
import json
import string

# about this script function: fetch coordinate_x and coordinate_y from table,
# provide them as url to get damn_result(community_name)
# update damn_result into table

def update_date(startTime, endTime):
    sql_from = " select eventid, coordinatex, coordinatey from dldata.tostatinfo WHERE CREATETIME BETWEEN to_date('"+startTime+"', 'yyyy-MM-dd') AND to_date('"+endTime+"', 'yyyy-MM-dd') AND SQNAME2_NEW IS NULL " 
    url_conf = 'http://172.25.65.21:8680/geoserver/wfs?request=GetFeature&version=1.0.0&typeName=communitynew_region&BBOX='  
    #############################################################################
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
            sql_to2 = " update dldata.tostatinfo set SQNAME2_NEW = "+"'" + "' " + " where eventid = " + str(row[0]) +" and CREATETIME BETWEEN to_date('"+startTime+"', 'yyyy-MM-dd') AND to_date('"+endTime+"', 'yyyy-MM-dd') and sqname2_new is null "
            print sql_to2
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
            sql_to2 = " update dldata.tostatinfo set SQNAME2_NEW = "+"'" + "' " + " where eventid = " + str(row[0])+" and CREATETIME BETWEEN to_date('"+startTime+"', 'yyyy-MM-dd') AND to_date('"+endTime+"', 'yyyy-MM-dd')  and sqname2_new is null "
            print sql_to2
            cursor2.execute(sql_to2)
            cursor2.execute("commit")
            continue
        else :
            print "features' length : " + str(len_fea)
            damn_result = features[0]['properties']['SQNAME2']
            sql_to2 = " update dldata.tostatinfo set SQNAME2_NEW = "+"'"+damn_result+"' "+" where eventid = "+str(row[0])+" and CREATETIME BETWEEN to_date('"+startTime+"', 'yyyy-MM-dd') AND to_date('"+endTime+"', 'yyyy-MM-dd')  and sqname2_new is null "
            print sql_to2
            cursor2.execute(sql_to2)
            cursor2.execute("commit")
        print "-----------------------------------------------------------------"

    cursor2.close()
    cursor1.close()
    conn.close()

json_file = file(r"time_config_all.json")
json_obj = json.load(json_file)["arrayTime"]

for i in range(0, len(json_obj)):
    startTime = json_obj[i]["startTime"]
    endTime = json_obj[i]["endTime"]
    update_date(startTime, endTime)
json_file.close()

