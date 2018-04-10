# Configure script for libada.
#   Copyright 2003, 2004 Free Software Foundation, Inc.
#
# This file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

AC_INIT
AC_PREREQ([2.63])

AC_CONFIG_SRCDIR([Makefile.in])

# Start of actual configure tests

AC_PROG_INSTALL

AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET

GCC_NO_EXECUTABLES
AC_PROG_CC
AC_GNU_SOURCE
AC_PROG_CPP_WERROR

AC_PROG_CC_C_O
# autoconf is lame and doesn't give us any substitution variable for this.
if eval "test \"`echo '$ac_cv_prog_cc_'${ac_cc}_c_o`\" = no"; then
  NO_MINUS_C_MINUS_O=yes
else
  OUTPUT_OPTION='-o $@'
fi
AC_SUBST(NO_MINUS_C_MINUS_O)
AC_SUBST(OUTPUT_OPTION)

AC_C_CONST
AC_C_INLINE
AC_C_BIGENDIAN

dnl When we start using libtool:
dnl AM_PROG_LIBTOOL

dnl When we start using automake:
dnl AM_CONFIG_HEADER(config.h:config.in)
AC_CONFIG_HEADER(config.h:config.in)

sinclude(../config/acx.m4)
ACX_NONCANONICAL_TARGET

# Need to pass this down for now :-P
AC_PROG_LN_S

# It's OK to check for header files.  Although the compiler may not be
# able to link anything, it had better be able to at least compile
# something.
AC_CHECK_HEADERS(sys/file.h sys/param.h limits.h stdlib.h malloc.h string.h unistd.h strings.h sys/time.h time.h sys/resource.h sys/stat.h sys/mman.h fcntl.h alloca.h sys/pstat.h sys/sysmp.h sys/sysinfo.h machine/hal_sysinfo.h sys/table.h sys/sysctl.h sys/systemcfg.h stdint.h stdio_ext.h process.h sys/prctl.h)
AC_HEADER_SYS_WAIT
AC_HEADER_TIME

# Determine sizes of some types.
AC_CHECK_SIZEOF([int])
AC_CHECK_SIZEOF([long])
AC_CHECK_SIZEOF([size_t])

AC_TYPE_INTPTR_T
AC_TYPE_UINTPTR_T
AC_TYPE_SSIZE_T

# Given the above check, we always have uintptr_t or a fallback
# definition.  So define HAVE_UINTPTR_T in case any imported code
# relies on it.
AC_DEFINE(HAVE_UINTPTR_T, 1, [Define if you have the \`uintptr_t' type.])

AC_TYPE_PID_T

# This is the list of functions which libiberty will provide if they
# are not available on the host.

funcs="asprintf"
funcs="$funcs atexit"
funcs="$funcs basename"
funcs="$funcs bcmp"
funcs="$funcs bcopy"
funcs="$funcs bsearch"
funcs="$funcs bzero"
funcs="$funcs calloc"
funcs="$funcs clock"
funcs="$funcs ffs"
funcs="$funcs getcwd"
funcs="$funcs getpagesize"
funcs="$funcs gettimeofday"
funcs="$funcs index"
funcs="$funcs insque"
funcs="$funcs memchr"
funcs="$funcs memcmp"
funcs="$funcs memcpy"
funcs="$funcs memmem"
funcs="$funcs memmove"
funcs="$funcs mempcpy"
funcs="$funcs memset"
funcs="$funcs mkstemps"
funcs="$funcs putenv"
funcs="$funcs random"
funcs="$funcs rename"
funcs="$funcs rindex"
funcs="$funcs setenv"
funcs="$funcs snprintf"
funcs="$funcs sigsetmask"
funcs="$funcs stpcpy"
funcs="$funcs stpncpy"
funcs="$funcs strcasecmp"
funcs="$funcs strchr"
funcs="$funcs strdup"
funcs="$funcs strncasecmp"
funcs="$funcs strndup"
funcs="$funcs strnlen"
funcs="$funcs strrchr"
funcs="$funcs strstr"
funcs="$funcs strtod"
funcs="$funcs strtol"
funcs="$funcs strtoul"
funcs="$funcs strtoll"
funcs="$funcs strtoull"
funcs="$funcs strverscmp"
funcs="$funcs tmpnam"
funcs="$funcs vasprintf"
funcs="$funcs vfprintf"
funcs="$funcs vprintf"
funcs="$funcs vsnprintf"
funcs="$funcs vsprintf"
funcs="$funcs waitpid"
funcs="$funcs setproctitle"

# Also in the old function.def file: alloca, vfork, getopt.

vars="sys_errlist sys_nerr sys_siglist"

checkfuncs="__fsetlocking canonicalize_file_name dup3 getrlimit getrusage \
 getsysinfo gettimeofday on_exit psignal pstat_getdynamic pstat_getstatic \
 realpath setrlimit sbrk spawnve spawnvpe strerror strsignal sysconf sysctl \
 sysmp table times wait3 wait4"

# These are neither executed nor required, but they help keep
# autoheader happy without adding a bunch of text to acconfig.h.
if test "x" = "y"; then
  AC_CHECK_FUNCS(asprintf atexit \
    basename bcmp bcopy bsearch bzero \
    calloc canonicalize_file_name clock \
    dup3 \
    ffs __fsetlocking \
    getcwd getpagesize getrlimit getrusage getsysinfo gettimeofday \
    index insque \
    memchr memcmp memcpy memmem memmove memset mkstemps \
    on_exit \
    psignal pstat_getdynamic pstat_getstatic putenv \
    random realpath rename rindex \
    sbrk setenv setproctitle setrlimit sigsetmask snprintf spawnve spawnvpe \
     stpcpy stpncpy strcasecmp strchr strdup \
     strerror strncasecmp strndup strnlen strrchr strsignal strstr strtod \
     strtol strtoul strtoll strtoull strverscmp sysconf sysctl sysmp \
    table times tmpnam \
    vasprintf vfprintf vprintf vsprintf \
    wait3 wait4 waitpid)
  AC_CHECK_DECLS([basename, ffs, asprintf, vasprintf, snprintf, vsnprintf, strtol, strtoul, strtoll, strtoull])
  AC_DEFINE(HAVE_SYS_ERRLIST, 1, [Define if you have the sys_errlist variable.])
  AC_DEFINE(HAVE_SYS_NERR,    1, [Define if you have the sys_nerr variable.])
  AC_DEFINE(HAVE_SYS_SIGLIST, 1, [Define if you have the sys_siglist variable.])
fi

# For each of these functions, if the host does not provide the
# function we want to put FN.o in LIBOBJS, and if the host does
# provide the function, we want to define HAVE_FN in config.h.

setobjs=
CHECK=
if test -n "${with_target_subdir}"; then

  # We are being configured as a target library.  AC_REPLACE_FUNCS
  # may not work correctly, because the compiler may not be able to
  # link executables.  Note that we may still be being configured
  # native.

  # If we are being configured for newlib, we know which functions
  # newlib provide and which ones we will be expected to provide.

  if test "x${with_newlib}" = "xyes"; then
    AC_LIBOBJ([asprintf])
    AC_LIBOBJ([basename])
    AC_LIBOBJ([insque])
    AC_LIBOBJ([random])
    AC_LIBOBJ([strdup])
    AC_LIBOBJ([vasprintf])

    for f in $funcs; do
      case "$f" in
	asprintf | basename | insque | random | strdup | vasprintf)
	  ;;
	*)
	  n=HAVE_`echo $f | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
	  AC_DEFINE_UNQUOTED($n)
	  ;;
      esac
    done

    # newlib doesnt provide any of the variables in $vars, so we
    # dont have to check them here.

    # Of the functions in $checkfuncs, newlib only has strerror.
    AC_DEFINE(HAVE_STRERROR)

    setobjs=yes

  fi

  # If we are being configured for Mingw, we know which functions
  # Mingw provides and which ones we will be expected to provide.

  case "${host}" in
  *-*-mingw*)
    AC_LIBOBJ([asprintf])
    AC_LIBOBJ([basename])
    AC_LIBOBJ([bcmp])
    AC_LIBOBJ([bcopy])
    AC_LIBOBJ([bzero])
    AC_LIBOBJ([clock])
    AC_LIBOBJ([ffs])
    AC_LIBOBJ([getpagesize])
    AC_LIBOBJ([index])
    AC_LIBOBJ([insque])
    AC_LIBOBJ([mempcpy])
    AC_LIBOBJ([mkstemps])
    AC_LIBOBJ([random])
    AC_LIBOBJ([rindex])
    AC_LIBOBJ([sigsetmask])
    AC_LIBOBJ([stpcpy])
    AC_LIBOBJ([stpncpy])
    AC_LIBOBJ([strndup])
    AC_LIBOBJ([strnlen])
    AC_LIBOBJ([strverscmp])
    AC_LIBOBJ([vasprintf])
    AC_LIBOBJ([waitpid])

    for f in $funcs; do
      case "$f" in
	asprintf | basename | bcmp | bcopy | bzero | clock | ffs | getpagesize | index | insque | mempcpy | mkstemps | random | rindex | sigsetmask | stpcpy | stpncpy | strdup | strndup | strnlen | strverscmp | vasprintf | waitpid)
	  ;;
	*)
	  n=HAVE_`echo $f | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
	  AC_DEFINE_UNQUOTED($n)
	  ;;
      esac
    done

    # Mingw doesnt provide any of the variables in $vars, so we
    # dont have to check them here.

    # Of the functions in $checkfuncs, Mingw only has strerror.
    AC_DEFINE(HAVE_STRERROR)

    setobjs=yes
    ;;

  *-*-msdosdjgpp)
    AC_LIBOBJ([vasprintf])
    AC_LIBOBJ([vsnprintf])
    AC_LIBOBJ([snprintf])
    AC_LIBOBJ([asprintf])

    for f in atexit basename bcmp bcopy bsearch bzero calloc clock ffs \
             getcwd getpagesize getrusage gettimeofday \
             index insque memchr memcmp memcpy memmove memset psignal \
             putenv random rename rindex sbrk setenv stpcpy strcasecmp \
             strchr strdup strerror strncasecmp strrchr strstr strtod \
             strtol strtoul sysconf times tmpnam vfprintf vprintf \
             vsprintf waitpid
    do
      n=HAVE_`echo $f | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
      AC_DEFINE_UNQUOTED($n)
    done


    setobjs=yes
    ;;

  esac

else

   # Not a target library, so we set things up to run the test suite.
   CHECK=really-check

fi

AC_SUBST(CHECK)
AC_SUBST(target_header_dir)

case "${host}" in
  *-*-cygwin* | *-*-mingw*)
    AC_DEFINE(HAVE_SYS_ERRLIST)
    AC_DEFINE(HAVE_SYS_NERR)
    ;;
esac

if test -z "${setobjs}"; then
  case "${host}" in

  *-*-vxworks*)
    # Handle VxWorks configuration specially, since on VxWorks the
    # libraries are actually on the target board, not in the file
    # system.
    AC_LIBOBJ([basename])
    AC_LIBOBJ([getpagesize])
    AC_LIBOBJ([insque])
    AC_LIBOBJ([random])
    AC_LIBOBJ([strcasecmp])
    AC_LIBOBJ([strncasecmp])
    AC_LIBOBJ([strdup])
    AC_LIBOBJ([vfork])
    AC_LIBOBJ([waitpid])
    AC_LIBOBJ([vasprintf])
    for f in $funcs; do
      case "$f" in
	basename | getpagesize | insque | random | strcasecmp)
	  ;;
	strncasecmp | strdup | vfork | waitpid | vasprintf)
	  ;;
	*)
	  n=HAVE_`echo $f | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
	  AC_DEFINE_UNQUOTED($n)
	  ;;
      esac
    done

    # VxWorks doesn't provide any of the variables in $vars, so we
    # don't have to check them here.

    # Of the functions in $checkfuncs, VxWorks only has strerror.
    AC_DEFINE(HAVE_STRERROR)

    setobjs=yes
    ;;

  esac
fi

if test -z "${setobjs}"; then

  case "${host}" in

  *-*-android*)
    # On android, getpagesize is defined in unistd.h as a static inline
    # function, which AC_CHECK_FUNCS does not handle properly.
    ac_cv_func_getpagesize=yes
    ;;

  *-*-mingw32*)
    # Under mingw32, sys_nerr and sys_errlist exist, but they are
    # macros, so the test below won't find them.
    libgnatprj_cv_var_sys_nerr=yes
    libgnatprj_cv_var_sys_errlist=yes
    ;;

  *-*-msdosdjgpp*)
    # vfork and fork are stubs.
    ac_cv_func_vfork_works=no
    ;;

  *-*-uwin*)
    # Under some versions of uwin, vfork is notoriously buggy and the test 
    # can hang configure; on other versions, vfork exists just as a stub.
    # FIXME: This should be removed once vfork in uwin's runtime is fixed.
    ac_cv_func_vfork_works=no
    # Under uwin 2.0+, sys_nerr and sys_errlist exist, but they are
    # macros (actually, these are imported from a DLL, but the end effect 
    # is the same), so the test below won't find them.
    libgnatprj_cv_var_sys_nerr=yes
    libgnatprj_cv_var_sys_errlist=yes
    ;;

  *-*-*vms*)
    # Under VMS, vfork works very different than on Unix. The standard test 
    # won't work, and it isn't easily adaptable. It makes more sense to
    # just force it.
    ac_cv_func_vfork_works=yes
    ;;

  esac

  # We haven't set the list of objects yet.  Use the standard autoconf
  # tests.  This will only work if the compiler works.
  AC_ISC_POSIX
  AC_REPLACE_FUNCS($funcs)
  AC_FUNC_FORK
  if test $ac_cv_func_vfork_works = no; then
    AC_LIBOBJ([vfork])
  fi
  # We only need _doprnt if we might use it to implement v*printf.
  if test $ac_cv_func_vprintf != yes \
     || test $ac_cv_func_vfprintf != yes \
     || test $ac_cv_func_vsprintf != yes; then
    AC_REPLACE_FUNCS(_doprnt)
  else
    AC_CHECK_FUNCS(_doprnt)
  fi

  for v in $vars; do
    AC_MSG_CHECKING([for $v])
    AC_CACHE_VAL(libgnatprj_cv_var_$v,
      [AC_LINK_IFELSE([AC_LANG_PROGRAM([[int *p;]],[[extern int $v []; p = $v;]])],
		      [eval "libgnatprj_cv_var_$v=yes"],
		      [eval "libgnatprj_cv_var_$v=no"])])
    if eval "test \"`echo '$libgnatprj_cv_var_'$v`\" = yes"; then
      AC_MSG_RESULT(yes)
      n=HAVE_`echo $v | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
      AC_DEFINE_UNQUOTED($n)
    else
      AC_MSG_RESULT(no)
    fi
  done

  # special check for _system_configuration because AIX <4.3.2 do not
  # contain the `physmem' member.
  AC_MSG_CHECKING([for external symbol _system_configuration])
  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <sys/systemcfg.h>]],
			[[double x = _system_configuration.physmem;]])],
    [AC_MSG_RESULT([yes])
    AC_DEFINE(HAVE__SYSTEM_CONFIGURATION, 1,
	      [Define if you have the _system_configuration variable.])],
    [AC_MSG_RESULT([no])])

  AC_CHECK_FUNCS($checkfuncs)
  AC_CHECK_DECLS([basename, ffs, asprintf, vasprintf, snprintf, vsnprintf])
  AC_CHECK_DECLS([calloc, getenv, getopt, malloc, realloc, sbrk])
  AC_CHECK_DECLS([strtol, strtoul, strtoll, strtoull])
  AC_CHECK_DECLS([strverscmp])
fi

# Determine x_ada_cflags
case $host in
  hppa*) x_ada_cflags=-mdisable-indexing ;;
  *) x_ada_cflags= ;;
esac
AC_SUBST([x_ada_cflags])

# Determine what to build for 'gnattools'
if test $build = $target ; then
  # Note that build=target is almost certainly the wrong test; FIXME
  default_gnattools_target="gnattools-native"
else
  default_gnattools_target="gnattools-cross"
fi
AC_SUBST([default_gnattools_target])

# Target-specific stuff (defaults)
TOOLS_TARGET_PAIRS=
AC_SUBST(TOOLS_TARGET_PAIRS)

# Per-target case statement
# ---/----------------------
case "${target}" in
  alpha*-dec-vx*) # Unlike all other Vxworks
    ;;
  m68k*-wrs-vx* \
  | powerpc*-wrs-vxworks \
  | sparc*-wrs-vx* \
  | *86-wrs-vxworks \
  | xscale*-wrs-vx* \
  | xscale*-wrs-coff \
  | mips*-wrs-vx*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-vxworks.adb"
    ;;
  sparc-sun-solaris*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-solaris.adb"
    ;;
  *86-*-solaris2*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-solaris.adb"
    ;;
  *86-*-linux* \
  | aarch64*-*-linux* \
  | arm*-*-linux* \
  | powerpc*-*-linux* \
  | *ia64-*-linux* \
  | alpha*-*-linux* \
  | sparc*-*-linux* \
  | hppa*-*-linux* \
  | mips*-*-linux* \
  | m68k-*-linux \
  | *x86_64-*-linux* \
  | *86-*-kfreebsd*-gnu \
  | *86-*-gnu \
  | *x86_64-*-kfreebsd*-gnu )
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-specific-linux.adb"
    ;;
  s390*-*-linux*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-linux.adb"
    ;;
  *86-*-freebsd*)
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-specific-linux.adb"
    ;;
  mips-sgi-irix*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-irix.adb"
    ;;
  hppa*-hp-hpux10*) # Unlike hpux11
    ;;
  hppa*-hp-hpux11*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-hpux.adb"
    ;;
  *-ibm-aix*)
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-specific-aix.adb"
    ;;
  alpha*-dec-osf*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-tru64.adb"
    ;;
  alpha*-dec-vms* | alpha*-dec-openvms* | alpha*-dec-vms* \
  | alpha*-hp-vms* | alpha*-hp-openvms* | alpha*-hp-vms*)
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-specific-vms-alpha.adb \
    symbols.adb<symbols-vms.adb \
    symbols-processing.adb<symbols-processing-vms-alpha.adb"
    ;;
  ia64*-dec-vms* | ia64*-dec-openvms* | ia64*-dec-vms* \
  | ia64*-hp-vms* | ia64*-hp-openvms* | ia64*-hp-vms*)
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-vms-ia64.adb \
    symbols.adb<symbols-vms.adb \
    symbols-processing.adb<symbols-processing-vms-ia64.adb"
    ;;
  *-*-cygwin32* | *-*-mingw32* | *-*-pe)
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-specific-mingw.adb"
    ;;
  powerpc-*-darwin*)
    TOOLS_TARGET_PAIRS="mlib-tgt-specific.adb<mlib-tgt-specific-darwin.adb"
    ;;
  *-*-lynxos)
    TOOLS_TARGET_PAIRS="\
    mlib-tgt-specific.adb<mlib-tgt-specific-lynxos.adb"
    ;;
esac

# Output: create a Makefile.
AC_CONFIG_FILES([Makefile])

AC_OUTPUT
