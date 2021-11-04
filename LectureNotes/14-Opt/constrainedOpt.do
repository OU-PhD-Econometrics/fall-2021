clear all
version 14.1
set more off
capture log close

log using constrainedOpt.log, replace

insheet using "https://raw.githubusercontent.com/OU-PhD-Econometrics/fall-2020/master/ProblemSets/PS8-factor/nlsy.csv", comma case clear

* various regression estimates of returns to schooling
reg logwage black hispanic female schoolt gradHS grad4yr

constraint 1 hispanic = 0.16
constraint 2 schoolt = 1+2*female

cnsreg logwage black hispanic female schoolt gradHS grad4yr, constraints(1/2)

gsem (logwage <- black hispanic female schoolt gradHS grad4yr)

log close
