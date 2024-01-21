## Update for cURL Certificate Authority Information

If you are using cURL in your PHP application and need to specify the path to the CA certificate bundle, ensure that the `curl.cainfo` directive in your `php.ini` file is set correctly.

Example `php.ini` modification:

```ini
curl.cainfo = "B:\sohel\bin\php\php7.4.33\ext\cacert.pem"
