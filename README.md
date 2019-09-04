# Acquia php-rdkafka Extension

Provides a build process for the php-rdkafka library extension that is
compatible with the Acquia hosting environment.

**See Also**

* [https://github.com/arnaud-lb/php-rdkafka](php-rdkafka)
* [https://github.com/edenhill/librdkafka](librdkafka)

## Building the Extension

Clone the repository from the acquia server:

```
git clone https://github.com/christophersmith262/acquia-php-rdkafka.git
```

Compile the PHP extension:

```
make
```

## Updating the Packages

Periodically, Acquia may update its hosting environment, or there may be a new
version of the php-rdkafka / librdkafka libraries available.

To update the packages provided here run:

```
make update-packages
```
