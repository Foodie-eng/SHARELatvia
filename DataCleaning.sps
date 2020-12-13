* Encoding: UTF-8.
*Syntax voor Artikel MTB2 Easyshare.
*Eerst alleen Litouwen weergeven dus Select cases, country = 57.

DATASET ACTIVATE DataSet1.
DATASET COPY  Country_Selection.
DATASET ACTIVATE  Country_Selection.
FILTER OFF.
USE ALL.
SELECT IF (country = 57).
EXECUTE.
DATASET ACTIVATE  DataSet1.

*n=1756.
*Selecteer de juiste wave.

DATASET ACTIVATE Country_Selection.
FREQUENCIES VARIABLES=wave
  /ORDER=ANALYSIS.

*Litouwen is alleen maar meegenomen in wave7 dus dat is makkelijk.
*Selecteer op de relevante variabelen, CASP12 en making ends meet.

FREQUENCIES VARIABLES=casp
  /ORDER=ANALYSIS.

*casp12, 131 missing information, dat 7,5%.


FREQUENCIES VARIABLES=co007_
  /ORDER=ANALYSIS.

*co007_ 15 missing information, 0,9%
    18 don't know.

*Filter missende waarden
    casp12 alleen -15
    co007_ twee: -15 en -12.

FREQUENCIES VARIABLES=casp
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=co007_
  /ORDER=ANALYSIS.

*De leeftijd wordt een factor die de steekproef kleiner gaat maken.

*Verdeling van de variabelen
    casp12 niet normaal, maar scheef links
    co007_ scheef rechts.

GRAPH
  /BAR(SIMPLE)=COUNT BY casp
  /INTERVAL CI(95.0).

GRAPH
  /BAR(SIMPLE)=COUNT BY co007_
  /INTERVAL CI(95.0).

DESCRIPTIVES VARIABLES=casp
  /STATISTICS=MEAN STDDEV MIN MAX KURTOSIS SKEWNESS.
