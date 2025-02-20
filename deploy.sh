#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�&�cdeploy.sh }Q�J�0}�W\�t�^�a�06AA�pl�KL�j��$[���6ulb�/	9��snέR��&���������"��JPޗn��f^m^ar\��g�v
c	-i�j��y��*��;bѦ�]\��H8����]n�E��"���[|}�����+ɋ�!�n�E�x3a�D$�F/Y�S*� ���8s\kS c��KCk^�w��}T��z��x��+$��F$���d��(��ݗٻ���얣|���?�y;��^Ž��	�;�J�\e��Jͳ�S��>\,�Ƨq$��y���Xg���6�s��t�4�ۧ����?�?��3ְ�?X�'���,��r�s�dg����j:�#Pk�W����W��  