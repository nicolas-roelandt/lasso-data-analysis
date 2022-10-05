drv <- DBI::dbDriver("PostgreSQL")
con <- DBI::dbConnect(
  drv,
  dbname ="noisecapture",
  host = "lassopg.ifsttar.fr", #server IP or hostname
  port = 5432, #Port on which we ran the proxy
  user="noisecapture",
  password= Sys.getenv('noisecapture_password') # password stored in .Renviron. Use this to edit it : usethis::edit_r_environ()
)
