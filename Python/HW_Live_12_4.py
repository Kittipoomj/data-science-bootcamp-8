## HW04 - Create Launched Year column in a dataframe [Database IMDB]

# install package
!pip install gazpacho

# import function
from gazpacho import Soup
import requests

# web scraping
url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"
headers = { "Accept-Language": "en-US"}
html = requests.get(url, headers=headers)
imdb = Soup(html.text)

## list comprehension
titles = imdb.find("h3", {"class" : "lister-item-header"})
clean_titles = [title.strip() for title in titles]

clean_titles

## get year
##
years =imdb.find("span", {"class" : "lister-item-year"})
clean_years = [year.strip() for year in years]

clean_years

## get rating from the website
## div: ratings-imdb-rating

ratings = imdb.find("div", {"class": "ratings-imdb-rating"})
clean_ratings = [ float(rating.strip( )) for rating in ratings]

clean_ratings

import pandas as pd

# create dataframe
movie_database = pd.DataFrame(data = {
    "title" : clean_titles ,
    "rating" : clean_ratings,
    "year" : clean_years
})

# print first five rows
movie_database.head()
