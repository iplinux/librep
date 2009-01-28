# $Id: .gdbinit,v 1.4 2003/07/26 08:34:27 jsh Exp $

# prints $arg0 to standard output
define v
call rep_print_val(Fstdout_file(), $arg0)
call rep_stream_putc(Fstdout_file(), '\n')
end

# prints the lisp backtrace
define lbt
call Fbacktrace(Fstdout_file())
call rep_stream_putc(Fstdout_file(), '\n')
end
