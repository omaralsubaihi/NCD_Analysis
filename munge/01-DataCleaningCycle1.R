# load all data files
diabetes_data <- read.csv('data/NCD_RisC_Lancet_2024_Diabetes_age_standardised_countries.csv')
BMI_data <- read.csv('data/NCD_RisC_Lancet_2024_BMI_age_standardised_country.csv')
Ch_data <- read.csv('data/NCD_RisC_Nature_2020_Cholesterol_age_standardised_countries.csv')
BP_data <- read.csv('data/NCD_RisC_Lancet_2017_BP_age_standardised_countries.csv')

#filtering for needed columns
diabetes_filterd <- diabetes_data %>%
  select( Country = Country.Region.World,
          Year,
          Sex,
          Diabetes_Prev = Prevalence.of.diabetes..18..years.)

BMI_filtered <- BMI_data %>%
  select(Country = Country.Region.World,
         Year,
         Sex,
         Obesity_Prev = Prevalence.of.BMI..30.kg.m...obesity.)


Ch_filtered <- Ch_data %>%
  select(Country = Country.Region.World,
         Year,
         Sex,
         Mean_Cholestrol = Mean.total.cholesterol..mmol.L.)

BP_filtered <- BP_data %>%
  select(Country = Country.Region.World,
         Year,
         Sex,
         Raised_BP_Prev = Prevalence.of.raised.blood.pressure)

# merge data sets on common columns 
df_merged_adult_ncd <- BMI_filtered %>%
  left_join(Ch_filtered, by = c("Year", "Sex", "Country")) %>%
  left_join(BP_filtered, by = c("Year", "Sex", "Country")) %>%
  left_join(diabetes_filterd, by = c("Year", "Sex", "Country"))

#filter for year 1990 to 2015 and remove world row
clean_data <- df_merged_adult_ncd %>%
  filter(
    Year >= 1990 & Year <= 2015,
    Country != "World"
  )

clean_data <- clean_data %>%
  mutate(
    Sex = as.factor(Sex),
    Country = as.factor(Country)
  )

cache('clean_data')