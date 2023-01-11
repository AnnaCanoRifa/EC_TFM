import requests 

QUERY_URL = 'http://sabiork.h-its.org/sabioRestWebServices/searchReactionDetails' 

# input: SabioReactionID 
#valid output fields: "fields[]":["KeggReactionID","SabioReactionID","Enzymename","ECNumber", "UniProtKB_AC","ReactionEquation","TransportReaction"] 

#data for ALL reactions 
query = {"SabioReactionID":"*", "fields[]":["KeggReactionID","ReactionEquation"]} 

# make GET request 
file = 
request = requests.get(QUERY_URL, params = query) 
request.raise_for_status() 


# results 
print(request.text) 

