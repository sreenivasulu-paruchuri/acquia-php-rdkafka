PREFIX_DIR:=$(shell pwd)/usr
PATH:=$(PATH):$(shell pwd)/usr/bin
PACKAGES_DIR:=$(shell pwd)/packages
BUILD_DIR:=$(shell pwd)/build
DIST_DIR:=$(shell pwd)/dist

dist: build php-rdkafka
	mkdir dist
	cp ${BUILD_DIR}/php-rdkafka/modules/*.so ${DIST_DIR}

php-rdkafka: build librdkafka autoconf
	cd ${BUILD_DIR}/php-rdkafka; phpize
	cd ${BUILD_DIR}/php-rdkafka; ./configure --prefix=${PREFIX_DIR} --with-rdkafka=${PREFIX_DIR}
	cd ${BUILD_DIR}/php-rdkafka; sed -i 's/^\s*RDKAFKA_SHARED_LIBADD\s*=.*$$/RDKAFKA_SHARED_LIBADD =/' Makefile
	cd ${BUILD_DIR}/php-rdkafka; sed -i 's/^\s*shared_objects_rdkafka\s*=\s*/shared_objects_rdkafka = ..\/librdkafka\/src\/*.o /' Makefile
	cd ${BUILD_DIR}/php-rdkafka; make

librdkafka: build
	cd ${BUILD_DIR}/librdkafka; ./configure --prefix=${PREFIX_DIR}
	cd ${BUILD_DIR}/librdkafka; make
	cd ${BUILD_DIR}/librdkafka; make install

autoconf: build m4
	cd ${BUILD_DIR}/autoconf; ./configure --prefix=${PREFIX_DIR}
	cd ${BUILD_DIR}/autoconf; make
	cd ${BUILD_DIR}/autoconf; make install

m4: build
	cd ${BUILD_DIR}/m4; ./configure --prefix=${PREFIX_DIR}
	cd ${BUILD_DIR}/m4; make
	cd ${BUILD_DIR}/m4; make install

build: download-packages
	mkdir ${BUILD_DIR}
	cp -r ${PACKAGES_DIR}/*.tar.gz ${BUILD_DIR}
	cd ${BUILD_DIR}; tar xvfz m4.tar.gz
	cd ${BUILD_DIR}; tar xvfz autoconf.tar.gz
	cd ${BUILD_DIR}; tar xvfz librdkafka.tar.gz
	cd ${BUILD_DIR}; tar xvfz php-rdkafka.tar.gz
	rm -rf ${BUILD_DIR}/*.tar.gz
	mv ${BUILD_DIR}/m4* ${BUILD_DIR}/m4
	mv ${BUILD_DIR}/autoconf* ${BUILD_DIR}/autoconf

download-packages:
	make -C ${PACKAGES_DIR}

update-packages:
	make -C ${PACKAGES_DIR} update

clean:
	rm -rf ${DIST_DIR}
	rm -rf ${BUILD_DIR}
	rm -rf ${PREFIX_DIR}
