#!/usr/bin/python

'''
public domain
http://stackoverflow.com/questions/12479570/given-a-torrent-file-how-do-i-generate-a-magnet-link-in-python
'''
import sys
import bencode
import hashlib
import base64
import urllib

torrentfile = sys.argv[1]
torrent = open(torrentfile).read()
metadata = bencode.bdecode(torrent)
hashcontents = bencode.bencode(metadata['info'])
digest = hashlib.sha1(hashcontents).digest()
b32hash = base64.b32encode(digest)
magneturi = 'magnet:?xt=urn:btih:%s' % b32hash 
print magneturi
