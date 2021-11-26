#' ----
#' title: remover fundo branco
#' author: mauricio vancine
#' date: 2021-11-26
#' ----

# prepare r ---------------------------------------------------------------

# packages
library(tidyverse)
library(magick)

# images ------------------------------------------------------------------

# image list
img_list <- dir(pattern = ".png", path = "01_slides/img", full.names = TRUE)
img_list

# image name
img_name <- dir(pattern = ".png", path = "01_slides/img")
img_name

# function
img_trans <- function(img){
  
  magick::image_read(img) %>% 
    magick::image_transparent("white") %>% 
    magick::image_write(sub(".png", "_bg.png", img))
}

# map
purrr::map(.x = img_list, .f = img_trans)

# end ---------------------------------------------------------------------