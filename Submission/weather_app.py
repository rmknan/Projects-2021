import requests

Api_key = "ca35056b2920c2249721d2d934cc5c2f" # API key
fav_cities_list = {}

# function for getting weather data

def get_weather_d (city):
    url = "http://api.openweathermap.org/data/2.5/weather"

    full_url = f"{url}?q={city}&appid={Api_key}&units=metric"
 

    result = requests.get(full_url) # getting data from API

    if result.status_code !=200:
        print("Error, unable to retrive weather info")
       

    weather_data = result.json() # storing data in a file
    return weather_data
    
    
# function to display  weather data

def display_wr_data(data):

    city = data['name']
    country = data['sys']['country']
    temp = data['main']['temp']
    real_feel = data['main']['feels_like']
    desc = data['weather'][0]['description']
    wind = data['wind']['speed']

    print("Weather of {a}, {b}".format(a=city,b=country))
    print("Temp - {} C".format(temp))
    print("Real Feel - {}".format(real_feel))
    print("Description - {}".format(desc))
    print("Wind speed - {} m/sec".format(wind))


# function to take in favourites cities

def add_fav(city):
    fav_cities_list

    if len(fav_cities_list)<= 2:
        
        if city in fav_cities_list:
            print("{} is in the list. Try again with another city".format(city))

        if get_weather_d(city) is not None:

            fav_cities_list[city] = get_weather_d(city)
            print("{} added to the favourites".format(city))
            print()

        else:
            print("Error, Please check the value you entered")
    else:
        print("You have exceeded the limit of 3 favourites")

# Function to print favourites list

def favourite_list():
    fav_cities_list

    print("Favourites:")

    for city, wr_data in fav_cities_list.items():
        if 'main' in wr_data and 'temp'in wr_data['main']:
            print("{:<5}, Temp - {:<7} C,{:<7}".format(city,wr_data['main']['temp'],wr_data['weather'][0]['description']))
        else:
            print("{}, weather information not available".format(city))

# Function to Update the favourites list

def update_cities(city_del,city_add):
    fav_cities_list

    if city_del in fav_cities_list:

        del fav_cities_list[city_del]
        print("{} has been deleted from the favourites list".format(city_del))

    if city_add not in fav_cities_list:
            add_fav(city_add)
    else:
        print("{} is already in favourites list".format(city_add)) 

if __name__ == "__main__":

    while True:

        print("\n Choose from the options:")
        print("1) Find out weather in a city")
        print("2) Favourite the cities you like")
        print("3) List your favourites")
        print("4) Update your favourites")
        print("5) Exit")
        print()
        

# Creating a option panel to choose from

        choice = input("Enter an option from (1-5):").strip() # Removes unwanted spaces from input

        if choice == '1':

            city = input("Enter city name:")
            print()
            wr_data = get_weather_d(city)
            display_wr_data(wr_data)
        
        elif choice == '2':

            city = input("Enter a city to add to favourites:")
            print()
            add_fav(city)
        
        elif choice == '3':

            favourite_list()
        
        elif choice == '4':

            city_del = input("Enter a city to remove from favourites: ") # This is case sensitive 
            city_add = input("Enter a city to add to the favourites : ")
            update_cities(city_del, city_add)

        elif choice == '5':

            print("Thank you for using the Weather_app!!")
            break
        
        else:
            print("Entered an incorrect option, try again")






