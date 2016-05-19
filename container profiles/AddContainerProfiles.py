import requests
import json
import csv

# This script posts new container profile records.
# I made the changes in a spreadsheet and use this to post them.

# Login information here
aspace_url = 'http://localhost:8089'
username = 'admin'
password = 'admin'
repo_num = '2'

container_profiles_to_update = 'infile.csv'

auth = requests.post(aspace_url+'/users/'+username+'/login?password='+password).json()
session = auth["session"]
headers = {'X-ArchivesSpace-Session':session}

# Open and iterate through the spreadsheet
with open(container_profiles_to_update,'rb') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        name = row[0]
        #Dimensions
        height = row[2]
        width = row[1]
        depth = row[3]
        #Create the updated fields in JSON, based on the spreadsheet columns
        payload = {'name':name,'height':height, 'width':width, 'depth':depth, 'dimension_units':'inches', 'extent_dimension':'width'}
        container_profile_data = json.dumps(payload)
        #Send it back to ArchivesSpace!
        container_profile_post = requests.post(aspace_url+'/container_profiles',headers=headers,data=container_profile_data).json()
        print container_profile_post