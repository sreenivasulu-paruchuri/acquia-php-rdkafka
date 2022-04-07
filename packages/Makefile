all: php-rdkafka.tar.gz librdkafka.tar.gz autoconf.tar.gz m4.tar.gz

php-rdkafka.tar.gz:
	git clone https://github.com/arnaud-lb/php-rdkafka.git
	tar cvfz php-rdkafka.tar.gz php-rdkafka/*
	rm -rf php-rdkafka

librdkafka.tar.gz:
	git clone --branch v1.8.2 https://github.com/edenhill/librdkafka.git
	tar cvfz librdkafka.tar.gz librdkafka/*
	rm -rf librdkafka

autoconf.tar.gz:
	wget http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz -O autoconf.tar.gz

m4.tar.gz:
	wget http://ftp.gnu.org/gnu/m4/m4-latest.tar.gz -O m4.tar.gz

update:
	make clean
	make

clean:
	rm -rf php-rdkafka*
	rm -rf librdkafka*
	rm -rf autoconf*
	rm -rf m4*
