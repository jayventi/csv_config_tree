# csv_config_tree
R script takes a csv configuration file layout similar to a yaml file and returns a R list

## Description
This R function takes as input a csv spreadsheet as a dataframe formatted in a similar mmanner to
a yamal files and produces a R list data type matching csv configuration format. The format allows
ignoring blank rows and comment lines indicated by #. 


## Usage
```
source("csv_walk_config_tree.R")
config = walk_csv_config_tree(raw_csv_config)
```
## Arguments

| |  |
| ---------------- | --------- |
| raw_csv_config | A dataframe importation of the configuration csv  |

## Details
The, R lists are interpretable as hierarchical trees in a format similar to yamal files except that the leaf level element are written as R lists, and the leaf list elements are written out as sequentially lists horizontally after the key name one element for each column. The format follows the key
value arrangement, the first element is the key indicated by a ':' character suffix, in the case of internal notes each node is indented one column to the right from its parent given
in the above row.

## Motivating Use Case
This is csv configuration format is intended to be used in laboratories using bioinformatics packages and using input data coming from large csv spreadsheets generally as output from analytic equipment, or analysis packages. Such laboratories frequently use R as their primary data management and analytic language; thus the choice of languages. Frequently data workers want to build configuration files by grabbing column headers for sample output and transfer those into configuration files. To make this as simple as possible it makes sense to copy horizontal sets of sample column names from csv data files into configuration files to facilitate setting up input parameters for further custom data processing. the format of this csv configuration script parser is set up to make the assembly of such files as easy as possible for the laboratory data workers.

## Formatting Examples

A configuration CSV file laidout as follows

```
group_set_columns:			
	Set1:	'331 sample'	'339 sample'		
rules:	
	max_allowed: 	7	
					
target_whitelist_rows:	2	3	8
```

Result in the following R list
```
$group_set_columns
[1] NA

$Set1
[1] "331 sample" "339 sample"

$rules
[1] NA

$max_allowed
[1] 7

$target_whitelist_rows
[1]  2  3  8 
```
