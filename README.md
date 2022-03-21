# Canadian Stress Levels and Work Time use

This repo is organized as follows.

The "inputs" folder includes the raw dataset used to create the figures and tables in this paper.
Due to the large size of the CSV file, it has been compressed and split into two using WINRAR before uploading.
The CSV must be extracted and stitched back together before it can be reproduced in the R-script.

The "scripts" folder includes an R-script file that cleans and organizes the raw data found in the data folder.

The "output" folder contains the R-data files created and saved using the R-script. 
The "paper" folder includes a pdf of the paper itself, an R-markdown file that the paper is built on, and a references file
includes references to all the literature and packages used in this paper.
The "survey" folder contains screenshots of the optional survey shown in the appendix of the paper. A link to the survey can
be found in the footnotes of the appendix section in the paper.

The 2015 GSS data has been archived and is not available on Statistics Canada website.
Access to the data in this paper was done through the University of Toronto library using the following steps:

1. Navigate to http://www.chass.utoronto.ca/
2. Data centre --> UofT users or http://dc.chass.utoronto.ca/myaccess.html
3. Click SDA @ CHASS, should redirect to sign in. Sign in.
4. Use the searchfield and type "2015 GSS"
5. Download the entire CSV

The raw CSV is coded so the use of the 2015 Canadian GSS dictionary is required to understand the data.
The data dictionary can be found at: https://gsg.uottawa.ca/data/gss/gss29_datadict-e.pdf
