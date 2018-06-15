#!/usr/bin/python
#-*- coding:utf-8 -*-

import sys
import os
from threading import *
import Queue
import time
import subprocess
#可調參數區
threads = 50
directory = "/root/Desktop/Work/sslv2"
folder_result = "result"

target_list = Queue.Queue()
os.chdir(directory)
count = 1

#爬所有IP進Queue

for root,dir,files in os.walk("./target2"):
    for f in files:
        path = os.path.join(root,f)
        #print path
        list_line = open(path, 'r').readlines()
        len(list_line)
        for i in range(0 , len(list_line)):
            target_list.put(list_line[i].strip())
total_targets = target_list.qsize()
print "Total ip :",total_targets

#多線程執行指令
class MyThread(Thread):
    def __init__(self, condition,i):
        Thread.__init__(self)
        self.cond = condition
        self.i = i

    def run(self):
        print "Starting Process: " + str(self.i)
        testing_vuls(self)
        #print "Exiting Process: " + str(self.i)

def testing_vuls(self):
    #print "start\r"
    while not target_list.empty():
        self.cond.acquire()
        path1 = target_list.get()
        self.cond.release()
        #print path1
        global count
        #print str(count)+' target:'+path1
        count +=1
        path_result_folder = folder_result  + "/"

        if not os.path.exists(path_result_folder):
            os.mkdir(path_result_folder)
        path_result = path_result_folder + path1
        #print path_result

        if os.path.exists(path_result):
            print "shit"
            continue

        #command = "nmap -sS -T4 --script sslv2.nse -p 443,465,563,636,989,990,992,993,994,995,1194,2484,3306,3713,5061,5432,6514,8443,10161,10162 " + path1 + " -oN  " + path_result + " -n
        #print str(self.i) +" "+ command
        #print "process: "+str(self.i)
        subprocess.call(["nmap", "-sP", "-T4","-oN",path_result,"-n",path1])
        #os.system(command)

        #self.cond.release()
        if count % 256 ==0:
            percent = count/total_targets*100
            print "Already finished "+percent+"%"
        target_list.task_done()

condition = Condition()

for i in xrange(threads):
    MyThread(condition,i).start()

print 'done'