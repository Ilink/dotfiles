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
sys.path.insert(0, '/usr/share/gdb_pretty/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
