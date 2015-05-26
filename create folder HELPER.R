## Useful to create a named and dated folder for output



folder <- paste0("XXXX-", Sys.Date())
if(!file.exists(folder)){ dir.create(folder)}