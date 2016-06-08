set history filename ~/.gdb_history
set history save
set history remove-duplicates unlimited
set confirm off

# Our programs generally ignore sigpipe, and so should GDB
handle SIGPIPE nostop noprint pass

# None of these work right now
set debug auto-load on
set auto-load python-scripts on
set auto-load safe-path /usr/share/gdb/auto-load:/usr/share/gdb/auto-load/usr/lib
set auto-load scripts-directory /usr/share/gdb/auto-load/usr/lib:.

#add-auto-load-safe-path .

# source /usr/share/gdb/auto-load/usr/lib/libstdc++.so.6.0.21-gdb.py



python
import sys
import os

sys.path.insert(0, '/usr/share/gdb_pretty/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)


old_pwd = os.getcwd()
# gdb.execute('cd /path/to/some/script')
# gdb.execute('source source-me.gdbinit')

# Restore old directory in case we had to change it
gdb.execute('cd %s' % old_pwd)
    
    
end
