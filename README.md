# denovoPores
Matlab scripts and functions for getting current amplitude data from ion-conductance measurements of denovo-designed nanopores.
Please refer to the following manuscript for context. https://www.biorxiv.org/content/10.1101/2023.12.20.572500v1


Typically the raw current data is filtered by an 8-pole Bessel filter and downsampled to 50 or 100 Hz. 
Then the `detectCurrentJumps.m` function is used on the downsampled data to get the start and end indices and the jump amplitudes.
The jump amplitudes can then be plotted simply as  `histogram(jump_amplitudes, nbins)` where `nbins` is the number of bins.
