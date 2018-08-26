---
tags: []
layout: page
title: Physics MSci Thesis Supporting Code
created: 1177489399
permalink: /projects/DurhamLevel4Thesis
redirect-from: /node/124
---
A selection of the Python and C++ code can be browsed in the <a href="http://code.mjhutchinson.com/L4ProjectPython/file/tip">source repository</a>.

I have also written detailed walkthroughs for <a href="/journal/2006-11-05/install_iraf_on_ubuntu_edgy_amd64">installing IRAF on Ubuntu</a> and <a href="/journal/2006-11-14/adding_pyraf_to_iraf_on_ubuntu_edgy">installing PyRAF and STSDAS/TABLES on Ubuntu</a>.

<h3>An Overview of the Code</h3>
The majority of the scripts require Python 2.4, NumPy, NumArray, SciPy, and PyFITS. Several of them variously require  MatPlotLib, PyVTK, GCC and PyRAF. They are all intended to be used on Linux/Unix from the command line (and some work in Cygwin on Windows). The lists of arguments are either documented inside the Python scripts, or are self-explanatory. The DatacubeUtils directory contains re-usable functionality common to the scripts, including the self-compiling C++ extension.

<dl>
<dt>auto-deconvolve-cube.py</dt><dd>Deconvolves each spectrum in the datacube along the wavelength axis using the hydrogen beta 4861 Angstrom line as the point spread function.</dd>

<dt>construct-error-cube.py</dt><dd>Calculates a datacube of error values for each spaxel using the empirical method documented in the project report.</dd>

<dt>extract-regions-from-fits.py</dt><dd>Extracts DS9-format regions from a datacube and averages each region into a single spectrum.</dd>

<dt>fit-OIII-gaussians-chisq.py</dt><dd>Performs a Gaussian decomposition of the OIII 4959 and 5007 Angstrom doublet in the FITS datacube spectra. Internal variables can be used to enable interactive plotting, Moffat functions and adaptive fitting. They can also be used to change the number of components fitted, the boundary constraints on the optimisation, and the regions over which chi-squared is calculated.</dd>

<dt>fit-guided-by-OIII.py</dt><dd>Derived from to <em>fit-OIII-gaussians-chisq.py</em>, this script uses the OIII fits to guide fits to the other lines.</dd>

<dt>fit-walker-components-csv-list.py</dt><dd>Uses Andrew Walker's hydrogen beta 4861 Angstrom components atlas to guide fits to other lines.</dd>

<dt>flip-cube-axes.py</dt><dd>Switches x and y axes of a FITS datacube.</dd>

<dt>gnuplot-from-csv.py</dt><dd>Converts a CSV file into a suitable format for Gnuplot's splot mode.</dd>

<dt>gnuplot-from-datacube-slice.py</dt><dd>Takes a constant-wavelength slice from a FITS datacube and converts it into a suitable format for Gnuplot's splot mode.</dd>

<dt>gnuplot-from-datacube-spectrum-slice.py</dt><dd>Takes an arbitrary "long-slit spectrum" slice from a FITS datacube and outputs it in a suitable format for Gnuplot's splot mode.</dd>

<dt>gnuplot-from-datacube-spectrum.py</dt><dd>Reads a single spectrum from a FITSdatacube and outputs it in a suitable format for Gnuplot's splot mode.</dd>

<dt>gnuplot-from-spectrum.py</dt><dd>Reads a single FITS spectrum and converts it into a suitable format for Gnuplot's splot mode.</dd>

<dt>reconstruct-cube-from-components.py</dt><dd>Generates a FITS datacube from a CSV components atlas.</dd>

<dt>remove-cube-continuum.py</dt><dd>Removes continuum from a datacube using IRAF.</dd>

<dt>simple-complexity-metric.py</dt><dd>Caculates a simple spectral width/complexity metric for a datacube.</dd>

<dt>vtk-from-fits-datacube.py</dt><dd>Converts a FITS datacube into VTK (Kitware/VolView) format.</dd>
</dl>
