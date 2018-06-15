import os
set_ip = set()
list_ip = list()
dict_port = dict()
for root , dirs , files in os.walk("result"):
    for f in files :
        path = os.path.join(root,f)
        if ".nmap" in path:
            list_line = open(path , 'r').readlines()
            for i in range(0 , len(list_line)):
                line = list_line[i]
                if "SSLv2 supported" in line:
                    ip = f.replace(".nmap","")
                    port = list_line[i-2].split("/")[0]
                    print ip,port
                    set_ip.add(ip)
                    list_ip.append([ip,port])
                    if str(port) not in dict_port.keys() :
                        dict_port[str(port)] = 1
                    else:
                        dict_port[str(port)] += 1

result1 = open("result-ip.txt","w")
for l in sorted(list(set_ip)):
    result1.write(l+"\n")
    result1.flush()
result1.close()

result2 = open("result-ip-port.txt","w")
for ip,port in list_ip:
    result2.write(ip+"\t"+port+"\n")
    result2.flush()
result2.close()

result3 = open("result-port.txt","w")
for port in dict_port.keys():
    count = dict_port[port]
    result3.write(port+":"+str(count)+"\n")
    result3.flush()
result3.close()
