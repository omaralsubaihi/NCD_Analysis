#filter for year 1990 to 2015 and remove world row
clean_data_men <- clean_data %>%
  filter(
    Sex == "Men",
    
  )

clean_data_women <- clean_data %>%
  filter(
    Sex == "Women",
    
  )

cache('clean_data_men')
cache('clean_data_women')