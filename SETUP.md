### Setup config/database.yml

We recommend the following for your local:

  development:
    adapter:  mysql2
    database: ark_dev
    username: ark_dev
    password: ark 
  
  test:
    adapter:  mysql2
    database: ark_test
    username: ark_test
    password: ark 

Inside mysql console do:

  mysql> create user 'ark_dev'@'localhost' identified by 'ark';
  mysql> grant all privileges on ark_dev.* to 'ark_dev'@'localhost';
  mysql> create user 'ark_test'@'localhost' identified by 'ark';
  mysql> grant all privileges on ark_test.* to 'ark_test'@'localhost';


### Setup config/facebook.yml app_id and secret_key

development:
  app_id:     "YOUR_APP_ID"
  secret_key: "YOUR_SECRET_KEY"

### Setup config/sunspot.yml

development:
  solr:
    hostname: localhost
    port: 8982
    log_level: INFO

### Setup your database

* rake db:migrate
* rake db:seed
* rake db:populate # Optional, to load sample records. This will reset your db.

### Start other services

* rake sunspot:solr:start
