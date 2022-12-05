.PHONY: clean

clean:
	rm -rf outputs
	rm -rf models
	rm -rf textlogs
	rm -f report.html
	mkdir outputs
	mkdir models
	mkdir textlogs
	


report.html: outputs report.Rmd EDAvisual.R EDA.R brain_stroke.csv
	R -e "rmarkdown::render('report.Rmd', output_format='html_document')"

outputs/variancebycomponents.tiff : brain_stroke.csv EDAvisual.R
	mkdir -p outputs
	Rscript EDAvisual.R

#EDA: brain_stroke.csv
#	Rscript EDA.R

#EDAvisual: brain_stroke.csv
#	Rscript EDAvisual.R
