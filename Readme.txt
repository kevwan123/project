To use this repo, use the commands:

git clone https://github.com/kevwan123/project.git
cd project
mkdir outputs

docker build . -t bios611
docker run -e PASSWORD="password" -v "$(pwd):/project" --name mycontainer2 -p -it 8787:8787 bios611
cd ..
docker cp project mycontainer2:/home/rstudio/project

Then log into the rstudio in the localhost:8787 and in the terminal type

cd project
sudo chown -R rstudio:rstudio .
#Type in the password
make EDAvisual
make report.html
make clean


File directory-
Report.rmd - the actual final report
bios611project.rmd: rmarkdown version of project, contains extraneous analysis that don't necessarily add to the report
brain_stroke.csv: data in a comma separated value file
Dockerfile: Dockerfile
EDA.R: R file containing model based exploratory data analysis that aren't important enough to make the final report
EDAvisual.R: R file containing visualization based exploratory data analysis and other plots to go into the final report 
Makefile: Makefile
outputs: folder containing all execution outputs. Emptied into trash upon "make clean"
Readme.txt: this file





https://www.kaggle.com/datasets/jillanisofttech/brain-stroke-dataset?resource=download

As copied from the website, the variables are. Our main goal will be to correlate stroke with the other variables to asses them as risk factors.

1) gender: "Male", "Female" or "Other"
2) age: age of the patient
3) hypertension: 0 if the patient doesn't have hypertension, 1 if the patient has hypertension
4) heart disease: 0 if the patient doesn't have any heart diseases, 1 if the patient has a heart disease 5) ever-married: "No" or "Yes"
6) worktype: "children", "Govtjov", "Neverworked", "Private" or "Self-employed" 7) Residencetype: "Rural" or "Urban"
8) avgglucoselevel: average glucose level in blood
9) bmi: body mass index
10) smoking_status: "formerly smoked", "never smoked", "smokes" or "Unknown"*
11) stroke: 1 if the patient had a stroke or 0 if not

The first objective is to investigate how stroke depends on the covariates.

The second objective of this project will be to investigate other possible things of interest in the data. Notably, we'd like to see if there are relationships between any of the other variables.

The third objective is to make a model purely for predictive accuracy.
