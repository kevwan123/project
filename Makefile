PHONY: clean

clean:
	rm outputs/*
	rm models/*
	rm textlogs/*

PHONY: report

report:
	Rscript project.R

PHONY: EDA
EDA: brain_stroke.csv
	Rscript EDA.R
PHONY: EDAvisual
EDAvisual: brain_stroke.csv
	Rscript EDAvisual.R
