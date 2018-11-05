# -*- coding: utf-8 -*-
import requests
from bs4 import BeautifulSoup
import json

class SetEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)
        return json.JSONEncoder.default(self, obj)

domain = 'http://www1.synapse.ne.jp/takata/dqm/haigou/'
target_url = domain + 'index.html'
r = requests.get(target_url)
soup = BeautifulSoup(r.text, 'lxml')

all_monsters = []

for a in soup.find_all('a'):
    page = a.get('href')

    if page.find('index') == -1:
        haigou_page = domain + page

        h = requests.get(haigou_page)
        h.encoding = h.apparent_encoding
        soup = BeautifulSoup(h.text, 'lxml')
        count = 0
        a = []

        for td in soup.find_all('table'):
            # td_text = td.text
            print(page, count % 3, td)

            # if count % 3 == 0:
                # print(td_text)

            # if td_text.find('配合') == -1:
            #    a.append(td_text)

            # if count % 3 == 0 and a != []:
            #    all_monsters.append(a)
            #    a = []

            count += 1


# print(json.dumps(all_monsters, ensure_ascii=False))
# print(json.dumps(dict, ensure_ascii=False, cls=SetEncoder))

