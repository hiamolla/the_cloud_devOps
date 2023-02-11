To run the app, copy the .env.example to .env and edit the following as you wish 

DB_DATABASE=<your_db_name>
DB_USERNAME=<your_db_user>
DB_PASSWORD=<your_db_password>

Then run, 
docker compose up -d

Then, run docker compose exec app php artisan migrate
to migrate the app data to the db

and you're all clear.


