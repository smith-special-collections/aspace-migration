import requests
import json

aspace_url = 'http://localhost:8089'
username = 'admin'
password = 'admin'
repo_num = '2'

auth = requests.post(aspace_url+'/users/'+username+'/login?password='+password).json()
session = auth["session"]
headers = {'X-ArchivesSpace-Session':session}

for d in range(1,6):
	resource_json = requests.get(aspace_url+'/repositories/'+repo_num+'/resources/'+str(d), headers=headers).json()
	resource_title = resource_json['title']
	print 'Current title is: ' +resource_title
	if 'Papers' in resource_title:
		resource_json["title"] = resource_json['title'].replace(" Papers"," papers")
		updated = requests.post(aspace_url+'/repositories/'+repo_num+'/resources/'+str(d), headers=headers, data=json.dumps(resource_json))
		print 'New title is: ' + resource_json["title"]
