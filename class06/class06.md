# Class 6: R functions
Mario Gutierrez PID: A69043009

- [Our first (silly) function](#our-first-silly-function)
- [A second function](#a-second-function)
- [A protein generating function](#a-protein-generating-function)

All functions in R have at least 3 things:

- A **name**, we pick this and use it to call our function.
- Input **arguments** (there can be multiple)
- The **body** lines of R coda that do the work.

## Our first (silly) function

Write a function to add some numbers

``` r
add <- function(x, y=1) {
  x + y
}
```

Now we can call this function:

``` r
add(10,100)
```

    [1] 110

``` r
add(c(10,10), 100)
```

    [1] 110 110

## A second function

Write a function to generate random nucleotide sequences of a user
specific length:

The `sample()` function can be helpful here.

``` r
v <- sample(c("A", "C", "G", "T"), size = 50, replace = TRUE)
v
```

     [1] "A" "T" "T" "A" "T" "C" "G" "T" "A" "G" "C" "G" "A" "T" "A" "A" "T" "G" "A"
    [20] "T" "G" "T" "C" "C" "T" "C" "G" "A" "A" "C" "A" "T" "A" "G" "A" "T" "C" "A"
    [39] "G" "G" "G" "T" "A" "T" "A" "G" "T" "T" "C" "G"

I want the a 1 element long character vector that looks like this
“CACAGC” not “C” “A” “C” “A” “G” “C”.

``` r
paste(v, collapse = "")
```

    [1] "ATTATCGTAGCGATAATGATGTCCTCGAACATAGATCAGGGTATAGTTCG"

Turn this into my first function:

``` r
generate_dna = function(size=50) {
  v = sample(c("A", "C", "G", "T"), size=size, replace = T)
  paste(v, collapse = "")
}
```

Test it:

``` r
generate_dna(60)
```

    [1] "GGCACTATGAAAAGAGTCCTCTTCAATTTAACGTAATAGGCATCGGACCTCCACGTAATC"

``` r
fasta <- TRUE
if(fasta){
  cat("HELLO You!")
} else{
  cat("No you dont!")
}
```

    HELLO You!

Add the ability to return a multi-element vector or a single element
fasta like a vector.

``` r
generate_fasta = function(size=50, fasta=TRUE) {
  v = sample(c("A", "C", "G", "T"), size=size, replace = T)
  s <- paste(v, collapse = "")
if(fasta){
  return(s)
  
} else{
  return(v)
}
  
  }
```

``` r
generate_fasta(10)
```

    [1] "CGCCCCCTAG"

## A protein generating function

``` r
generate_protein = function(size=50, fasta=TRUE) {
  v = sample(c("A", "R", "N", "D", "C", "Q", "E", "G", "H", "I", "L", "K", "M", "F", "P", "S", "T", "W", "Y", "V"), size=size, replace=TRUE)
  s <- paste(v, collapse = "")
  if(fasta){
    return(s)
  } else{
    return(v)
  }
}
```

``` r
generate_protein(6)
```

    [1] "DGICYR"

Use aur new `generate_protein()` function to make random protein
sequences of lenght 6 to 12 (i.e. one length 6, one length 7, etc. up to
12).

One way to do this is “brute force”:

``` r
generate_protein(6)
```

    [1] "AKHLRC"

``` r
generate_protein(7)
```

    [1] "YIGYQLI"

``` r
generate_protein(8)
```

    [1] "NQQPPLIW"

``` r
generate_protein(9)
```

    [1] "VKLFHGLSY"

``` r
generate_protein(10)
```

    [1] "GMNAVLQASI"

``` r
generate_protein(11)
```

    [1] "CYDIVQWYSPG"

``` r
generate_protein(12)
```

    [1] "FCGRECHECDPI"

A second way is to use a `for()` loop:

``` r
lengths <- 6:12
lengths
```

    [1]  6  7  8  9 10 11 12

``` r
for(i in lengths){
  cat(">", i, "\n", sep = "")
  aa <- generate_protein(i)
  cat(aa)
  cat("\n")
}
```

    >6
    VQCIIV
    >7
    VHGYHHV
    >8
    FDQPTMTM
    >9
    LSHEYSYDD
    >10
    PWNDHQLFEM
    >11
    PSKHISINFGP
    >12
    GKDPMIWNYGDA

``` r
paste(c("barry", "monika"), sep = "")
```

    [1] "barry"  "monika"

A third, and better, way to solve this is to use the `apply()` family of
functions, specifically tehe `sapply()` function in in this case.

``` r
sapply(6:12, generate_protein)
```

    [1] "QRIESQ"       "NHNVHMK"      "QTPLLYRY"     "PGLFRVEYQ"    "RPWQNCYTYS"  
    [6] "DSGKSFRRYWC"  "HWDTRKKCLSHQ"
