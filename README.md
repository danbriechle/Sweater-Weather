# README

Sweater Weather is an API that serves weather information, meaningful location photos and gifs to users based upon city and state queries. It is hosted on heroku at https://murmuring-sands-50229.herokuapp.com

It responds to the following interactions. 

# Weather Request
This request serves current weather, hourly weather and daily forecast 

GET /api/v1/forecast?location=denver,co

<img width="1437" alt="screen shot 2019-02-27 at 10 36 09 am" src="https://user-images.githubusercontent.com/42418816/53510624-b09d5480-3a7b-11e9-89d1-237adf5cc3d0.png">

# Image Request
This request serves an image url based upon the location 

Get /api/v1/backgrounds?location=denver,co

<img width="1159" alt="screen shot 2019-02-27 at 10 40 38 am" src="https://user-images.githubusercontent.com/42418816/53510845-2bff0600-3a7c-11e9-9558-1c3793cc78d5.png">

# Account Creation 
This request creates a user account in the data base and serves an api key to the client. 

Post /api/v1/sessions?email=mat@gmail.com&password=good_password

<img width="1152" alt="screen shot 2019-02-27 at 10 44 20 am" src="https://user-images.githubusercontent.com/42418816/53511078-be9fa500-3a7c-11e9-9764-5b448b333bd4.png">

If the request is unsuccesful the call renders a message explain to the user they have made an error in their request

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511200-13432000-3a7d-11e9-80fc-92ee625703df.png">

# Session Creation 
This request creates a session for an existing user it a succesful request response with the users api key.

Post /api/v1/sessions?email=mat@gmail.com&password=good_password

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511307-61582380-3a7d-11e9-8c74-56a788f3977e.png">

If the request is usuccessful the call renders a message explain to the user they have made an error in their request

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511200-13432000-3a7d-11e9-80fc-92ee625703df.png">

# Favorite Creation 
This request allows registered users to post favorite locations. Succesful requests respond with the following message. Upon the creation of the favorite location the latitude and longitude of the location are stored in the database to speed up future calls to the api.

Post /api/v1/favorites?api_key=b9c24e283013d516d836b62a346f00c8&location=flemington,nj

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511541-e9d6c400-3a7d-11e9-8592-562f9d177efd.png">

If the request is usuccessful the call renders a 401 and a message explain to the user they have made an error in their request

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511200-13432000-3a7d-11e9-80fc-92ee625703df.png">

# Listing Favorite Locations 
This request allows the user to see all of their favorite locations. Its displays the current weather for each location. 

Get /api/v1/favorites?api_key=b9c24e283013d516d836b62a346f00c8

<img width="1149" alt="screen shot 2019-02-27 at 11 09 56 am" src="https://user-images.githubusercontent.com/42418816/53512656-8dc16f00-3a80-11e9-9ff9-9053bd18deae.png">

If the request is usuccessful the call renders a 401 and a message explain to the user they have made an error in their request

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511200-13432000-3a7d-11e9-80fc-92ee625703df.png">

# Deleting Favorite Locations
This request allows the user to delete one of their favorite locations. Upon the deletion of the location it displays the current weather for the deleted location and a message informing the user they have deleted the location. 

Delete api/v1/favorites?api_key=b9c24e283013d516d836b62a346f00c8&location=bridgewater,nj

<img width="638" alt="screen shot 2019-02-27 at 11 16 57 am" src="https://user-images.githubusercontent.com/42418816/53512947-3e2f7300-3a81-11e9-9692-691e2d6a161f.png">

If the request is usuccessful the call renders a 401 and a message explain to the user they have made an error in their request

<img width="1156" alt="screen shot 2019-02-27 at 10 46 46 am" src="https://user-images.githubusercontent.com/42418816/53511200-13432000-3a7d-11e9-80fc-92ee625703df.png">
