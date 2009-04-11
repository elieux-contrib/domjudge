# http://autoconf-archive.cryp.to/ax_with_prog.html
#
# Copyright C 2008 Francesco Salvestrini <salvestrini@users.sourceforge.net>
# Copyright C 2008 Dustin J. Mitchell <dustin@cs.uchicago.edu>
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.

AC_DEFUN([AX_WITH_PROG],[
	AC_PREREQ([2.61])

	pushdef([VARIABLE],$1)
	pushdef([EXECUTABLE],$2)
	pushdef([VALUE_IF_NOT_FOUND],$3)
	pushdef([PATH_PROG],$4)

	AC_ARG_VAR(VARIABLE,Absolute path to EXECUTABLE executable)

	AS_IF(test -z "$VARIABLE",[
		AC_MSG_CHECKING(whether EXECUTABLE executable path has been provided)
		AC_ARG_WITH(EXECUTABLE,AS_HELP_STRING([--with-EXECUTABLE=[[[[PATH]]]]],absolute path to EXECUTABLE executable), [
			AS_IF([test "$withval" != "yes"],[
				VARIABLE="$withval"
				AC_MSG_RESULT($VARIABLE)
			],[
				VARIABLE=""
				AC_MSG_RESULT([no])
			])
		],[
			AC_MSG_RESULT([no])
		])

		AS_IF(test -z "$VARIABLE",[
			AC_PATH_PROG([]VARIABLE[],[]EXECUTABLE[],[]VALUE_IF_NOT_FOUND[],[]PATH_PROG[])
		])
	])

	popdef([PATH_PROG])
	popdef([VALUE_IF_NOT_FOUND])
	popdef([EXECUTABLE])
	popdef([VARIABLE])
])