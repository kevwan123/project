FROM rocker/verse 

#testing
FROM rocker/verse 
RUN R -e "update.packages(\"rmarkdown\")" 
RUN R -e "install.packages(\"matlab\")" 
RUN R -e "install.packages(\"MASS\")" 
RUN R -e "install.packages(\"mgcv\")" 
RUN R -e "install.packages(\"Rtsne\")" 
RUN R -e "install.packages(\"stats\")"