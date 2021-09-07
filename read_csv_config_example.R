# read_csv_config_example.R
# little testbed for walk_csv_config_tree.R

######################################################################
# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")
# Use pacman to load add-on packages as desired
pacman::p_load(pacman, rio)
# Installs misc. helpers
if (!require("stringr")) install.packages("stringr")

# import csv_walk_config_tree.R source
source("csv_walk_config_tree.R")

# configuration variables ## #########################################
csv_config_file           = "csv_config_example.csv"

# get csv system configuration  ######################################
csv_config_filepath <- paste(csv_config_file, sep="")
raw_csv_config = import(csv_config_filepath)

# run walk_csv_config_tree with raw_csv_config ## ####################

config = walk_csv_config_tree(raw_csv_config)
cat('\n## sample configuration file returned as a list ## ############\n')
print(config)