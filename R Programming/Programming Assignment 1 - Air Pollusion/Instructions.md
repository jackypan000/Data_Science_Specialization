Introduction

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file **specdata.zip** that you can download from the Coursera web site.

**Although this is a programming assignment, you will be assessed using a separate quiz.**

Data

The zip file containing the data can be downloaded here:

* [specdata.zip](https://eventing.coursera.org/api/redirectStrict/LHps4bIo2yoz1ifHpnM3auN45VtoSKK0d1zgjMaZcfs-MsIAOn4LEzR-rkDhxIPysNPkJON01TVjRZoyDjag9A.leoO_eMHau4BnJFO-uBGpw.flwOOQyWYgrn2Xl5QeRVdaUn9IEA3PUNwyyqUQ7z7EAWIuKrjwrg9eXxrh-Vq7sQEV0G6CeALnk3PX8bYqy6G1MR07WlQWzoI3O603JiiPDu_b95IUml7EqtKrXoYUBY2UiRnHbLidx5wtHyWCTNP-uaIJyR6n-SVKWkKuDjygbMK8FSEeEr9yyV4_Z8Ddh5b42fUliRAuuZTxeMUMryUCxBTbWVaUuffXJqpCIUi_TdDjR4lTW5kIQSAHOIejgS7zs1xj5RpxaEDxyu481Fg4hOpazamJTV535amiZdP_K6gxBZffkqn8kEuSEbImbvqh8WrcUogWLS_YE3QrBT9NA2fD_7oicWve7g4zDxRaQTCqAgbD8ctr4RCQ0OAUvh) [2.4MB]

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:

* Date: the date of the observation in YYYY-MM-DD format (year-month-day)
* sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
* nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

Part 1

Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/AniR5o00EeWk4wrqfRkIMQ_26d94fc4f878a8b60240f6fda6e17f6c_Screen-Shot-2015-11-17-at-9.03.29-AM.png?expiry=1454716800000&hmac=vknu1N4wQwwlcuHSJpEKo2rnnABaYd3HYE2xNYTgFws)

You can see some [example output from this function](https://eventing.coursera.org/api/redirectStrict/9oHAnCYPQJmTP0em_jeR4Ur6kmJwxL3DoGy5Rv8qOIir6cNbsQlChTgMMjJNYOGRht3Sg7bzp37URHV1R0l1mQ.lw63DxoGtSSIAUbAtpkzfQ.TqZibm_GElm9n3FrEm-BDE6pkQ1d7ExsCJXFioEJVLjH_vqITD7Oz4F7eogO0q6uQ5PejYFeG2xexdkQ7iw2bQsg0yWj-w9zAV-Qr_-X6QWgn4X_6sWIbKj7L5EvIJmTjtE6_38zz3HF6WyI6uN1a_RAhUlrQZOa02MhB8uJR03dKxmgrsefdSBm321nwj21aQ-DBduesAJ1Sw0zfY3d7gzwxs1EqpALf2qzOVHDteYV7kNTDiOcu7brN-LJwgVLoWaLldBf5DEVAJKoVqAGH4GryQAdZFza-iNuRzbRkkhp5VPJ7jVncywlFGlBa41Ut4Yf7UrISc-dyWhLl-C0UpY0dsg3MI9Z5zuyKCJWxH-fr4TMXNErb4R-33Hz6Hv37tLGZhDAfy6x8VAkOBLl6A). The function that you write should be able to match this output. Please save your code to a file named `pollutantmean.R`.

Part 2

Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Jnt5oY00EeWisRLkE7o57Q_2713e281672695ec59b29f83ec95f7b1_Screen-Shot-2015-11-17-at-9.04.23-AM.png?expiry=1454716800000&hmac=s85-l5AUp--Sp5zOi-s0wNikxb3oTMzdhi22pBXZpn8)

You can see some [example output from this function](https://eventing.coursera.org/api/redirectStrict/cZX0X-4uFP3QTiNztPg6rNoLqKdV4Vv7bZYHt-7TuZs950GXqgHDf8tMB5GYkFYwW8pyoBJ4C8f3Q2FrO8t8Sg.B4kmCa8uxkRPY-Px9pyBrw.mCsKiW-TcopQEk_gUX8cpA1HJkjlI2PolRIY43UseI98uX8Bj2FOwtoI3seew87qZ97J-hCv3xQTFZvtp9VeljPuGGf2JV90Sfk43ESa9jyHbxiIGCTb4UJLLPKlHjGwjzJgNqoYFCtpX-gtOOt-lPc8j5xy6cqyxQTcZRd32ZGtZhcpBzF-lvM_V_7k5z1gmlp7iE2y4CnMh7QGi9fmdF3DJOFj65VA3hOaXNX9W8GKPuK_7tNmLCHXFBBFywKm5QAuqFcUY9ku5u_xSnfN-ZGN2aGPXLisZ-R7mp4zHPYQnfiUpme_mr-stpMoG6G1ExBlZec7Z9xcXGan3XyTm1eiIrndkahvMNRSL18HyQACssAKRNGbQdINXFaTSgT8z6JFvD20rcl0jmGcIsLKTQ). The function that you write should be able to match this output. Please save your code to a file named complete.R. To run the submit script for this part, make sure your working directory has the file `complete.R` in it.

Part 3

Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/OXaiR400EeWk4wrqfRkIMQ_dafbb49ef127335cf1f9468fcadbd4ee_Screen-Shot-2015-11-17-at-9.05.01-AM.png?expiry=1454716800000&hmac=5I3xn62nqXFV24IXTsFEen6gvfVGrGNe8TXAUGZZ6BE)

For this function you will need to use the `cor` function in R which calculates the correlation between two vectors. Please read the help page for this function via `?cor` and make sure that you know how to use it.

You can see some example output from this function. The function that you write should be able to match this output. Please save your code to a file named `corr.R`. To run the submit script for this part, make sure your working directory has the file `corr.R` in it.
