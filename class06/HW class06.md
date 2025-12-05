# HW Class 6
Mario Gutierrez PID: A69043009

## Can you improve this analysis code?

``` r
library(bio3d)

s1 <- read.pdb("4AKE") # kinase with drug
```

      Note: Accessing on-line PDB file

``` r
s2 <- read.pdb("1AKE") # kinase no drug
```

      Note: Accessing on-line PDB file
       PDB has ALT records, taking A only, rm.alt=TRUE

``` r
s3 <- read.pdb("1E4Y") # kinase with drug
```

      Note: Accessing on-line PDB file

``` r
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s1, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
```

![](HW-class06_files/figure-commonmark/unnamed-chunk-1-1.png)

``` r
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
```

![](HW-class06_files/figure-commonmark/unnamed-chunk-1-2.png)

``` r
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
```

![](HW-class06_files/figure-commonmark/unnamed-chunk-1-3.png)

Make a function

My first attempt is to put all the repetitive code inside the function
to get an idea of how it would work.

``` r
bio3d_plot <- function(pbd1, pbd2, pbd3) {
  s1 <- read.pdb("4AKE") # kinase with drug
  s2 <- read.pdb("1AKE") # kinase no drug
  s3 <- read.pdb("1E4Y") # kinase with drug
  s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
  s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
  s3.chainA <- trim.pdb(s1, chain="A", elety="CA")
  s1.b <- s1.chainA$atom$b
  s2.b <- s2.chainA$atom$b
  s3.b <- s3.chainA$atom$b
  plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
  plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
  plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
}
```

``` r
bio3d_plot("4AKE")
```

      Note: Accessing on-line PDB file

    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    /var/folders/z9/b1dc_hqj20z1n2ypp58ksvy80000gn/T//RtmpUwyRC3/4AKE.pdb exists.
    Skipping download

      Note: Accessing on-line PDB file

    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    /var/folders/z9/b1dc_hqj20z1n2ypp58ksvy80000gn/T//RtmpUwyRC3/1AKE.pdb exists.
    Skipping download

       PDB has ALT records, taking A only, rm.alt=TRUE
      Note: Accessing on-line PDB file

    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    /var/folders/z9/b1dc_hqj20z1n2ypp58ksvy80000gn/T//RtmpUwyRC3/1E4Y.pdb exists.
    Skipping download

![](HW-class06_files/figure-commonmark/unnamed-chunk-3-1.png)

![](HW-class06_files/figure-commonmark/unnamed-chunk-3-2.png)

![](HW-class06_files/figure-commonmark/unnamed-chunk-3-3.png)

The last step was still repetitive because it was the same, so I have
now to “summarize” every section of the code to make the function.

I can see that the code is made up of 4 parts: read, trim, chain and
plot. I’m going to use these parts as arguments in the body of the
function. In the arguments of function I just can write chain and elety
as “A” and “CA”, respectively, as they are always the same in the code.

``` r
bio3d_plot_2 <- function(pdb_n, chain = "A", elety = "CA") {
  
  pdb <- read.pdb(pdb_n)
  pdb_chain <- trim.pdb(pdb, chain = chain, elety = elety)
  b <- pdb_chain$atom$b
  plot <- plotb3(b, sse = pdb_chain, typ = "l", ylab = "Bfactor")
  
}
```

Testing it:

``` r
bio3d_plot_2("4AKE")
```

      Note: Accessing on-line PDB file

    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    /var/folders/z9/b1dc_hqj20z1n2ypp58ksvy80000gn/T//RtmpUwyRC3/4AKE.pdb exists.
    Skipping download

![](HW-class06_files/figure-commonmark/unnamed-chunk-5-1.png)

``` r
bio3d_plot_2("1AKE")
```

      Note: Accessing on-line PDB file

    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    /var/folders/z9/b1dc_hqj20z1n2ypp58ksvy80000gn/T//RtmpUwyRC3/1AKE.pdb exists.
    Skipping download

       PDB has ALT records, taking A only, rm.alt=TRUE

![](HW-class06_files/figure-commonmark/unnamed-chunk-5-2.png)

``` r
bio3d_plot_2("1E4Y")
```

      Note: Accessing on-line PDB file

    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    /var/folders/z9/b1dc_hqj20z1n2ypp58ksvy80000gn/T//RtmpUwyRC3/1E4Y.pdb exists.
    Skipping download

![](HW-class06_files/figure-commonmark/unnamed-chunk-5-3.png)
