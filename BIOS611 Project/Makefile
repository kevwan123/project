PHONY: clean

clean:
        rm outputs/*

PHONY: plswork

plswork:
        Rscript project.R

PHONY: EDA
EDA: brain_stroke.csv
        Rscript EDA.R
PHONY: EDAvisual
EDAvisual: brain_stroke.csv
        Rscript EDAvisual.R
