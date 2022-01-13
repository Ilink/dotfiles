set disassembly-flavor intel
set print thread-events off
set print static-members off
set print object on
# this shows one struct entry per line
set print pretty on
set print array-indexes on
set auto-load local-gdbinit on
set auto-load safe-path /
handle SIGPIPE nostop noprint pass
handle SIGUSR1 nostop ignore
set history save on
set history filename ~/.gdb_history
set history remove-duplicates unlimited

# set scheduler-locking step

define psimds
    print/c *((char*)&$arg0)@16
end

define dpsimds
    display *((char*)&$arg0)@16
end

define psimdu
    print/u *((uint8_t*)&$arg0)@16
end

define dpsimdu
    display/u *((uint8_t*)&$arg0)@16
end

define sb
    save breakpoints gdb_breakpoints
end

# is 8 byte aligned - returns 0 when true
define ia8
    print (uint64_t)$arg0 & (uintptr_t)7 
end

python
import sys
sys.path.insert(0, '/home/ilink/src/gcc/libstdc++-v3/python')
sys.path.insert(0, '/home/ilink/src')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)

# import gdb_tools
# gdb_workspace_path = "gdb_workspace.json"
# gdb_tools.ShowDisplaysCmd(gdb_workspace_path)
# gdb_tools.SetBreakpointsCmd(gdb_workspace_path) 
# 
# import tbb_debug
# tbb_debug.TbbBt()

end

# Turn off a bunch of annoying stuff so things are set
# without gdb bothering us about it
set breakpoint pending on
set pagination off

# Shows arrays with 1 line per entry - easier to read for me
set print array on

# Workspace setup
#################
# define on_update
#     show_displays
# end
# 
# define hook-stop
#     on_update
# end
# 
# define hookpost-up
#     on_update 
# end
# 
# define hookpost-down
#     on_update
# end
# 
# define hookpost-frame
#     on_update 
# end

# set_breakpoints


# set confirm off
#
# # echo Sourcing gdb_breakpoints\n
# # source gdb_breakpoints
#
# # TODO respect these flags if they were turned off already
# # set breakpoint pending off
# # set pagination on
# set confirm on

source ~/src/gdb-dashboard/.gdbinit
# Dashboard configuration

python
from datetime import datetime

python
class LineInfo(Dashboard.Module):
    '''Display line and source file information.'''

    def __init__(self):
        pass

    def label(self):
        return 'LineInfo'

    def lines(self, term_width, term_height, style_changed):
        out = []
        out.append("hello!")
        return out

    # def add(self, arg):
    #     if arg:
    #         self.notes.append((datetime.now(), arg))
    #     else:
    #         raise Exception('Cannot add an empty note')
    # 
    # def commands(self):
    #     return {
    #         'add': {
    #             'action': self.add,
    #             'doc': 'Show info for current line.'
    #         }
    #     }

    # def attributes(self):
    #     return {
    #         'timestamp': {
    #             'doc': 'Show the timestamp along with the note.',
    #             'default': True,
    #             'type': bool
    #         }
    #     }
end

# re-run start so it picks up our custom module
# TODO i had to disable the start in the dashboard, because
# calling it a second time makes the first load of the dashbard
# ignore my -layout options.
python Dashboard.start()
# dashboard -layout source expressions history registers assembly
dashboard stack -style limit 1
# dashboard variables
# dashboard -layout source expressions history stack lineinfo
dashboard -layout source expressions history stack

# These show the dashboard whenever navigating the stack
define hookpost-up
    dashboard
end

define hookpost-down
    dashboard
end

define hookpost-frame
    dashboard
end

define hook-run
    dashboard
end

# define hook-stop
#     dashboard
# end


