# denovoPores
Matlab scripts and functions for getting current amplitude data from ion-conductance measurements of denovo-designed nanopores.
Please refer to the following manuscript for context. https://urldefense.com/v3/__https://doi.org/10.1101/2023.12.20.572500).we've__;!!K-Hz7m0Vt54!gH7Esjx7nS9px6LBECqzYF8iG6zazdK9WsMEBjDLUNKl16tDJZPg_0pfywriRznI277m-gZ-OB3Tb0vjUUr_E_ivsA$


Typically the raw current data is filtered by an 8-pole Bessel filter and downsampled to 50 or 100 Hz. 
Then the `detectCurrentJumps.m` function is used on the downsampled data to get the start and end indices and the jump amplitudes.
The jump amplitudes can then be plotted simply as  `histogram(jump_amplitudes, nbins)` where `nbins` is the number of bins.
