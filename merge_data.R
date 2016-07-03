## merge files
if(!exists("NEISCC")){
    NEISCC <- merge(NEI, SCC, by = "SCC")
}