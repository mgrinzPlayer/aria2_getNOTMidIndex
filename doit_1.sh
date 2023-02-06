#!/bin/sh
export HOST=x86_64-w64-mingw32
export PREFIX=$PWD/forARIA2/$HOST

tar -xf libraries_and_aria/gmp-6.2.1.tar.xz
cd gmp-6.2.1
./configure --enable-shared=no --enable-static=yes --host=$HOST --prefix=$PREFIX --enable-fat --disable-cxx
make -j4
make install
cd ..

tar -xf libraries_and_aria/expat-2.5.0.tar.xz
cd expat-2.5.0
./configure --enable-shared=no --enable-static=yes --host=$HOST --prefix=$PREFIX --without-examples
make -j4
make install
cd ..

tar -xf libraries_and_aria/sqlite-autoconf-3400100.tar.gz
cd sqlite-autoconf-3400100
./configure --enable-shared=no --enable-static=yes --host=$HOST --prefix=$PREFIX
make -j4
make install
cd ..

tar -xf libraries_and_aria/c-ares-1.19.0.tar.gz
cd c-ares-1.19.0
export curl_cv_func_getnameinfo_args='const struct sockaddr *,socklen_t,DWORD,int'
export curl_cv_func_recv_args='SOCKET,char *,int,int,int'
export curl_cv_func_recvfrom_args='SOCKET,char *,int,int,struct sockaddr *,int *,int'
export curl_cv_func_send_args='SOCKET,const char *,int,int,int'
./configure --enable-shared=no --enable-static=yes --host=$HOST --prefix=$PREFIX --without-random --disable-tests
make -j4
make install
cd ..

tar -xf libraries_and_aria/zlib-1.2.13.tar.xz
cd zlib-1.2.13
export CHOST=$HOST
./configure --static --prefix=$PREFIX
make -j4
make install
cd ..

tar -xf libraries_and_aria/libssh2-1.10.0.tar.gz
cd libssh2-1.10.0
./configure --enable-shared=no --enable-static=yes --host=$HOST --prefix=$PREFIX --disable-examples-build
make -j4
make install
cd ..
