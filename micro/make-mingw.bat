gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o main.o main.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o util.o util.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o tree.o tree.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o symtab.o symtab.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o type.o type.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o stmt.o stmt.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o check.o check.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o expr.o expr.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o err.o err.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o run.o run.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o eval.o eval.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o bltin.o bltin.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o doeval.o doeval.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o mkc.o mkc.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o a60-scan.o a60-scan.c
gcc -g -O -DDEBUG    -DHAVE_CONFIG_H -DLIBDIRPATH=\"/usr/local/lib\"   -c -o a60-ptab.o a60-ptab.c
gcc   -o a60 main.o util.o tree.o symtab.o type.o stmt.o check.o expr.o err.o run.o eval.o bltin.o doeval.o mkc.o a60-scan.o a60-ptab.o  -lm
