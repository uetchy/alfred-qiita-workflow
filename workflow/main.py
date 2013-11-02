import json, alfred, urllib, urllib2, datetime, httplib, sys

endpoint = 'https://qiita.com/api/v1/search?%s'
query = [('q', sys.argv[1].decode('utf-8'))]
url = endpoint % urllib.urlencode(query)

req = urllib2.Request(url)
req.add_header('User-Agent', 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)')
response = urllib2.urlopen(req)
data = json.loads(response.read())

results = []

for q in data:
  arg = q['url']
  subtitle = "Stocks: " + str(q['stock_count']) + "    LGTM:" + str(q['lgtm_count']) + "   Comments:" + str(q['comment_count']) + "   Create At:" + q['created_at']

  item = alfred.Item({'uid': 1, 'arg': arg}, q['title'], subtitle.encode('utf-8'), ('icon.png', {'type': 'png'}))
  results.append(item)

xml = alfred.xml(results)
alfred.write(xml)