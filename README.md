# Acquia php-rdkafka Extension

Provides a build process for the php-rdkafka library extension that is
compatible with the Acquia hosting environment.

**See Also**

* [php-rdkafka](https://github.com/arnaud-lb/php-rdkafka)
* [librdkafka](https://github.com/edenhill/librdkafka)

## Building the Extension

To build the extension for a given environment run the following command, replacing `<drush-alias>` with the drush alias for the environment.

```
bash <(curl https://raw.githubusercontent.com/sreenivasulu-paruchuri/acquia-php-rdkafka/master/remote-compile.sh) @<drush-alias>
```

## Updating the Packages

Periodically, Acquia may update its hosting environment, or there may be a new
version of the php-rdkafka / librdkafka libraries available.

To update the packages provided here run:

```
make update-packages
```

## Included Packages

**Executable Code**

* [php-rdkafka](https://github.com/arnaud-lb/php-rdkafka)
* [librdkafka](https://github.com/edenhill/librdkafka)

**Build Dependencies**

* [m4](https://www.gnu.org/software/m4)
* [autoconf](https://www.gnu.org/software/autoconf)
