FROM rocker/verse 

#testing
FROM rocker/verse 
RUN R -e "update.packages(\"rmarkdown\")" 
RUN R -e "install.packages(\"matlab\")" 
RUN R -e "install.packages(\"MASS\")" 
RUN R -e "install.packages(\"mgcv\")" 
RUN R -e "install.packages(\"Rtsne\")" 
RUN R -e "install.packages(\"tidyverse\")"
RUN R -e "install.packages(\"tidyr\")"
RUN R -e "install.packages(\"tibble\")"
RUN R -e "install.packages(\"dplyr\")"
RUN R -e "install.packages(\"glmnet\")"
RUN R -e "install.packages(\"gbm\")"
RUN R -e "install.packages(\"ggplot2\")"
RUN R -e "install.packages(\"plotly\")"
RUN apt-get install -y sudo
RUN sudo usermod -aG sudo rstudio
