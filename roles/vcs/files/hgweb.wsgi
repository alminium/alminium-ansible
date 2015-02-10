# An example WSGI for use with mod_wsgi, edit as necessary
# See http://mercurial.selenic.com/wiki/modwsgi for more information

# Path to repo or hgweb config to serve (see 'hg help hgweb')
config = "/etc/opt/alminium/hgweb.config"

import os
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
os.environ["HGENCODING"] = "UTF-8"

# Uncomment and adjust if Mercurial is not installed system-wide:
#import sys; sys.path.insert(0, "/path/to/python/lib")

# Uncomment to send python tracebacks to the browser if an error occurs:
#import cgitb; cgitb.enable()

# enable demandloading to reduce startup time
#from mercurial import demandimport; demandimport.enable()

#from mercurial.hgweb import hgweb
#application = hgweb(config)

from mercurial.hgweb import hgweb, hgwebdir, wsgicgi
application = hgwebdir(config)