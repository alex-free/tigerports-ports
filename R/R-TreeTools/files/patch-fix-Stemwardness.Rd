--- man/Stemwardness.Rd.orig	2024-11-04 17:31:05.000000000 +0800
+++ man/Stemwardness.Rd	2026-02-06 19:34:39.000000000 +0800
@@ -54,17 +54,6 @@
 falls within the clade \emph{(a, b)}, so should be considered more "crownwards",
 yet has a smaller root-node distance (3).
 
-\insertFig{Stemwardness.png}{TreeTools}{
-par(mfrow = c(1, 2), mar = rep(0.3, 4))
-plot(ape::read.tree(text="(.,(.,(.,(.,(X1,(a,b))))));"))
-ape::nodelabels(1:4, 9:12)
-ape::edgelabels(1:2, 11:12)
-
-plot(ape::read.tree(text="(.,((.,(.,.)),(b,(X2,a))));"))
-ape::nodelabels(1:3, c(9, 12, 13))
-ape::edgelabels(1, 12)
-}
-
 \code{SisterSize()} measures the number of leaves in the clade that is sister to
 the chosen leaf, as proposed by \insertCite{Asher2020;textual}{TreeTools}.
 In the examples above, \emph{X1} has a sister size of 2 leaves, whereas \emph{X2},
