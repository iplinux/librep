#!/bin/sh

# load libtool configuration
ltconf=/tmp/libtool.conf.$$
../libtool --config >$ltconf
. $ltconf
rm -f $ltconf

prefix="$1"
libdir="$2"
version="$3"
LIBS="$4"
repexecdir="$5"
sitelispdir="$6"

libpath="-L${libdir}"

cat <<EOF
#!/bin/sh

usage="usage: rep-config [--version] [--libs] [--cflags] [--execdir] [--lispdir]"

if test \$# -eq 0; then
      echo "\${usage}" 1>&2
      exit 1
fi

while test \$# -gt 0; do
  case \$1 in
    --version)
      echo "${version}"
      ;;
    --cflags)
      echo "-I${prefix}/include -I${repexecdir}"
      ;;
    --libs)
      echo "${libpath} -lrep ${LIBS}"
      ;;
    --execdir)
      echo "${repexecdir}"
      ;;
    --lispdir)
      echo "${sitelispdir}"
      ;;
    *)
      echo "\${usage}" 1>&2
      exit 1
      ;;
  esac
  shift
done
EOF
