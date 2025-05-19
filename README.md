# Generic FRAP Analysis Toolset

## User's request

Analysis of FRAP data acquired with Metamorph.

## What does it do?

The toolbar aims to semi-automatically extract data and calculate several characteristic values. It relies on **ImageJ**. ImageJ is used to extract raw data from the original images. Three plugins are also used: **Metamorph Companion** for opening the FRAPped region of interest, **BioFormat** for extracting the real time of image acquisition, and **ResultsTable To GraphPad Prism** for exporting the data.

## General Information on FRAP and Analysis Methods

### Raw Data

Mean intensities and areas from 3 zones are collected:
*   **Bleached Zone(s):** The area where photobleaching occurred.
*   **Background Zone:** An area placed in the background noise.
*   **Reference Zone:** An area placed on an unbleached cell and away from the FRAPped zone, used to quantify fluorescence loss due to observational photobleaching.

### Evaluating Bleaching

Two estimators are built from the raw data:
*   **Bleach depth:** 1 corresponds to 100% effective FRAP, 0 corresponds to no impact.
*   **Gap ratio:** 1 corresponds to an absence of bleaching impact in the reference zone (indicating a good reference and specific FRAP), 0 corresponds to a maximum impact of FRAP in the zone (indicating it is not a good reference).

### Data Correction and Normalization

Calculation formulas are used.
*   **Correction for background:** For each time point, the mean intensity in the background zone is subtracted from the mean intensities recorded in the bleached zones and the unaffected reference zone.
*   **Correction for observational photobleaching:** For each time point, the mean intensities of the bleached zones are divided by the mean intensity of the reference zone.
*   **Normalization:** For each time point, for the bleached zone and the adjacent zone, the normalized and background-corrected data are divided by the average of the corresponding normalized and corrected data before FRAP. **This is double normalization**.
    *   The values obtained this way vary between 1 and a value greater than 0 depending on the FRAP efficiency.
*   **Full-Scale Double Normalization:** To account for variability related to FRAP efficiency, values can be forced onto a scale from 0 to 1. **This is full-scale double normalization**.

### Data Modeling

Based on the model used, experimental values can be adjusted to two types of models:
*   **Mono-exponential fluorescence recovery**.
*   **Bi-exponential model**.

The choice can be made in two ways:
*   **Reasoned choice:** Based on a model describing exchanges between compartments, different molecular populations (free or bound, interacting or alone), posed as differential equations. Solving the system of equations allows choosing between the two classically used forms or extracting a third.
*   **Experience-based choice:** Attempt to fit both models to the experimental data and then evaluate their adequacy.

Numerical fitting of the model to the experimental data assigns a numerical value to each parameter (I0, α, β, γ, δ). Several values are also extracted to evaluate the model's relevance to the experimental data:
*   **RSS:** The sum of the square of the residuals, where residuals are the difference between the experimental value and the value calculated from the model.
*   **TSS:** The sum of squares of the differences from the mean of the values calculated from the model.
*   **R2:** The correlation coefficient, corresponding to the ratio RSS/TSS. It varies between -1 and 1, with 1 corresponding to maximum correlation and 0 to no correlation (model and data are independent).

### Extraction of Characteristic Values from the Model

Two values can be extracted from the data fitted to the model:
*   **t1/2:** The time at which 50% of the maximum fluorescence recovery is achieved. This indicates the speed at which fluorescence recolonizes the bleached area.
*   **Mobile fraction:** The maximum amplitude of fluorescence recovery. This indicates the proportion of free molecules capable of recolonizing the bleached area.

Depending on the normalization performed (double normalization or full-scale double normalization) and the fitting done (mono- or bi-exponential), these values are either calculated from the coefficients (I0, α, β, γ, δ) or extrapolated.

Specific calculation notes:
*   **Mobile fraction (Double normalization / Full-scale double normalization):** Calculated directly from the coefficients for the mono-exponential model. Also calculated directly from coefficients for the bi-exponential model.
*   **t1/2 (Mono-exponential model, Double normalization / Full-scale double normalization):** Calculated directly from coefficients.
*   **t1/2 (Bi-exponential model):** No simple direct calculation. It can be estimated by detecting the two points bounding the half-recovery, then averaging the two corresponding times by the distance between the point intensity and the expected half-recovery intensity.

### Reference Publications on FRAP and Normalizations

*   **First use of FRAP for mobility measurement:** D. Axelrod, D. E. Koppel, J. Schlessinger, E. Elson, and W. W. Webb, “Mobility measurement by analysis of fluorescence photobleaching recovery kinetics,” Biophys. J., vol. 16, no. 9, pp. 1055–1069, 1976.
*   **Introduction of double normalization in analysis:** R. D. Phair, S. a. Gorski, and T. Misteli, “Measurement of Dynamic Protein Binding to Chromatin In Vivo, Using Photobleaching Microscopy,” Methods Enzymol., vol. 375, no. 2000, pp. 393–414, 2004.

## How to use it?

### Versions of the software used

*   ImageJ 1.54p

### Additional required software

You must have installed the plugins by dragging and dropping them into the ImageJ toolbar; a save window will appear, click Ok.
*   **BioFormat:** Comes with Fiji.
*   **Metamorph Companion:** Downloadable [here](https://github.com/fabricecordelieres/IJ-Plugin_Metamorph-Companion/releases/download/v1.1/MM_Companion.jar).
*   **ResultsTable To GraphPad Prism:** Downloadable [here](https://github.com/fabricecordelieres/IJ-Plugin_ResultsTable-To-GraphPad-Prism/releases/download/v1.0/ResultsTable_To_GraphPad_Prism.jar).
*   **ZipIt:** Downloadable [here](https://github.com/fabricecordelieres/IJ-Plugin_Zip-It/releases/download/v1.0/Zip_It.jar).

### How to install and use the macro/toolset?

#### Prerequisites / Data structure

**Data sets must absolutely be stored in a single source directory**. You can have multiple "MDA" series in one directory. **For each series (identified by its nd file), a ROI file (rgn) must be present; otherwise, it will not be analyzed**. The macro will create a sub-directory in the output directory for each source nd file.

#### ImageJ Toolset

1.  Update ImageJ: Help/update then Ok.
2.  Move the toolset into the ImageJ installation directory, under the `macros/toolset` sub-directory.
3.  In the ImageJ toolbar, the last button (red chevrons) allows selecting the toolset to use.

The toolbar now has 3 custom buttons, allowing you to perform the 3 necessary steps for data processing and analysis in turn.

The toolbar looks like this: 
![GUI](Illustrations/GUI.jpg "GUI")

#### Button 1, Add Reference ROIs

This button allows reading the regions that have been FRAPped and adding the reference ROIs to them.

Once the button is clicked, the following steps are performed:
1.  **A graphical interface appears**.
    1.  The user is asked to **choose the source directory** where the data to analyze are stored (all series stored in the same directory where each nd file must have a corresponding rgn file).
    2.  The user is asked to **choose the destination directory** where the analyzed data will be stored; the macro will create a sub-directory for each series analyzed.
2.  The macro will list the nd files in the source directory for which an rgn file is found; a sub-directory will be created in the output directory only for these pairs.
3.  For each nd file meeting point 3:
    1.  The first image of the series is opened, along with the regions from the rgn file.
    2.  The user is asked to **trace a reference zone for the background noise**.
        1.  A circular region is drawn at the mouse cursor.
        2.  To increase its radius, hold down **shift** and click (moving the mouse activates radius updating).
        3.  To increase its radius, hold down **alt** and click (moving the mouse activates radius updating).
        4.  Once the region is well placed and sized, press the **spacebar**.
        5.  NB: All these indications are displayed in the ImageJ status bar.
    3.  The user is asked to **trace a reference zone for the non-bleached signal**. The same principles as above apply for drawing the ROI.
    4.  The content of the ROI Manager is saved in the output directory corresponding to the series.
4.  Once all cells have been reviewed, continue by pressing the second button.

#### Button 2, Perform Analysis

This button allows recording all mean intensities over time for each region to be analyzed.

Once the button is clicked, the following steps are performed:
1.  **A graphical interface appears**.
    1.  The user is asked to **choose the source directory** where the data to analyze are stored.
    2.  The user is asked to **choose the destination directory** where the analyzed data will be stored.
    3.  For 100% normalization before bleach, an average of the corrected intensity values is calculated over the first points of the recording; the user is asked to **define this number of points before bleach for normalization**.
    4.  As the data can have multiple channels, the user is asked to **choose the channel number** on which to perform the quantifications.
2.  For each series:
    1.  The images are loaded from the source directory; they are saved in hyperstack format in the output directory.
    2.  The **BioFormat plugin is used to determine, for each image, the time elapsed** since the start of acquisition; this provides precise quantification of the experiment's time course.
    3.  The ROIs are loaded from the destination directory; this provides access to the regions to be quantified as well as the reference regions.
    4.  The intensities of all ROIs are determined over time; a file containing the quantifications over time is created in the series' output directory. It is named `SERIES_NAME_Quantif_Raw.xls`. The same data are also saved in GraphPad Prism format.
    5.  Data normalization and correction are performed. The results are saved in excel and GraphPad format in the output directory (`SERIES_NAME_Quantif_Norm.xls.pzfx`).
    6.  Both data sets (raw and normalized) are plotted; the corresponding graphs are also saved.

#### Button 3, Get graphs & data

This button prepares the data for analysis and numerical fitting to a mono- or bi-exponential model.

Once the button is clicked, the following steps are performed:
1.  The user is asked to **choose the destination directory** where the analyzed data were stored.
2.  A directory named `_toZip` is created in the destination directory.
3.  For each series, the xls file containing the normalized data is copied to the `_toZip` directory.
4.  The `_toZip` directory is zipped into the file `_DataToUpload.zip`.
5.  The `_toZip` directory is deleted.
6.  A window appears, indicating that the web browser is about to open, pointing to the Google Colab analysis script.
7.  The user is invited to **follow the instructions contained in the script**: Within the script, execute each step: press the play button to the left of the relevant cells.

Steps for using the Google Colab script:
*   **Step 1:** Non-interactive. Point to the [ ] symbol. The button transforms into a play button. Press the play button and wait for a green checkmark to appear on the left.
*   **Step 2:** Interactive. If necessary, unfold the cell and point to the [ ] symbol. The button transforms into a play button. Press the play button: a "Select a file" button should appear below the cell. Use it to navigate your disk and **locate the zip file (`_DataToUpload.zip`)**. The selected file will be uploaded to the Google Colab environment's shared space and uncompressed.
*   **Step 3:** Non-interactive. Point to the [ ] symbol. The button transforms into a play button. Press the play button and wait for a green checkmark to appear on the left. Data compilation will occur. The resulting files will be compressed and **downloaded directly to your computer**.

Once the data processing is finished by the script, all outputs are automatically compressed (`Fitted_data.zip`) and downloaded. This file contains a folder for each input data set, named after the data set. Each folder contains the following files:
*   `DATASET-NAME_single-exponential_plots.pdf`: For data where fitting to a simple exponential was possible, this file displays a page per region of interest.
*   `DATASET-NAME_single-exponential_fitted_values.xlsx`: For double-normalized and full-scale data, this file displays the modeled values (when fitting to a simple exponential was possible).
*   `DATASET-NAME_single-exponential_fitting_parameters.xlsx`: For double-normalized and full-scale data, this file displays the parameters of the simple exponential model, the quality of the fit, and the estimation of the t half-value and the mobile fraction (when fitting was possible).
*   `DATASET-NAME_double-exponential_plots.pdf`: For data where fitting to a double exponential was possible, displays a page per region of interest, overlaying the fitted data with the original data as a graph.
*   `DATASET-NAME_double-exponential_fitted_values.xlsx`: For double-normalized and full-scale data, displays the modeled values (when fitting by a double exponential was possible).

The Google Colab script is also accessible here: [https://github.com/fabricecordelieres/Colab-FRAP_Script](https://github.com/fabricecordelieres/Colab-FRAP_Script).
