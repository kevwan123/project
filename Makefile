.PHONY: clean

clean:
	rm -rf outputs
	rm -rf derived_data
	rm -f report.html
	rm -f report.pdf
	rm -f report.html
	mkdir outputs
	


report.html: outputs report.Rmd EDAvisual.R brain_stroke.csv outputs/tsne_reduceddata.jpeg outputs/tsne_numericalonly.jpeg outputs/pca12.jpeg outputs/barplothypertensionheartdisease.jpeg outputs/barplotsmokingstatus.jpeg outputs/glmglucose.jpeg outputs/glmbmi.jpeg outputs/histage.jpeg outputs/glmage.jpeg outputs/glmage.jpeg outputs/variancebycomponents.jpeg outputs/bybmi.jpeg outputs/byglucose.jpeg outputs/variancebycomponents.jpeg outputs/scatters.jpeg outputs/byage.jpeg
	R -e "rmarkdown::render('report.Rmd', output_format='html_document')"

outputs/tsne_reduceddata.jpeg outputs/tsne_numericalonly.jpeg outputs/pca12.jpeg outputs/barplothypertensionheartdisease.jpeg outputs/barplotsmokingstatus.jpeg outputs/glmglucose.jpeg outputs/glmbmi.jpeg outputs/histage.jpeg outputs/glmage.jpeg outputs/glmage.jpeg outputs/variancebycomponents.jpeg outputs/bybmi.jpeg outputs/byglucose.jpeg outputs/variancebycomponents.jpeg outputs/scatters.jpeg outputs/byage.jpeg: brain_stroke.csv EDAvisual.R
	mkdir -p outputs
	Rscript EDAvisual.R




EDAvisual: brain_stroke.csv
	Rscript EDAvisual.R
