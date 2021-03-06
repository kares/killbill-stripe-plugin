killbill-stripe-plugin
======================

Plugin to use [Stripe](https://stripe.com/) as a gateway.

Release builds are available on [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.kill-bill.billing.plugin.ruby%22%20AND%20a%3A%22stripe-plugin%22) with coordinates `org.kill-bill.billing.plugin.ruby:stripe-plugin`.

Requirements
------------

The plugin needs a database. The latest version of the schema can be found here: https://raw.github.com/killbill/killbill-stripe-plugin/master/db/ddl.sql.

Getting started
---------------

1. Build the project (see below) and verify you can run local tests: `rake test:spec`
2. Go to [stripe.com](http://stripe.com/) and create an account. This account will be used as a sandbox environment for testing.
3. In your Stripe account, click on **Your Account** (top right), then click on **Account Settings** and then on the **API Keys** tab. Write down your keys.
4. Create a stripe.yml file under killbill-stripe-plugin with the following:

    ```
    :stripe:
      :api_secret_key: 'sk_test_AAABBBCCC'
      :api_publishable_key: 'pk_test_DDDEEEFFF'
      :log_file: '/var/tmp/stripe.log'
      :test: true
    :database:
      :adapter: sqlite3
      :database: test.db
    ```

5. Verify the setup by running the killbill-stripe-plugin integration tests: `rake test:remote:spec`
6. Go to your Stripe account, you should see some data (e.g. account created).
7. Congrats! You're all set!


Build
-----

To build the project:

    rvm use jruby
    bundle install
    jbundle install
    rake killbill:clean
    rake build
    rake killbill:package
