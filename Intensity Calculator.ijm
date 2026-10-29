////////////////////////////////////////////////
//////////MP_Script to analyse schisises using "Analyse Particles" 21.8.26
//////////////////////////////////////////////////

//Prompt user to select the ROI
run("Select All");
waitForUser("Choose an ROI of interest", "The ROI should be limited to schism region (s) of retina. Please choose one side of the optical nerve at a time");
//Crop and remove everything outside of the ROI;
setBackgroundColor(0, 0, 0);
run("Clear Outside");

//Set measurments to what is needed 
run("Set Measurements...", "area integrated limit redirect=None decimal=3");

//run("Threshold...");
run("Threshold...");
setOption("BlackBackground", true);
//setThreshold(1, 86, "raw"); //if you need to set a threshorld use this 
setAutoThreshold("Otsu dark");
waitForUser("Adjust Threshold", "Please adjust the threshold sliders, then click OK.");
run("Convert to Mask");

//Apply masks and run Analyse particles;
run("Erode");
run("Dilate");
run("Analyze Particles...", "size=1-Infinity pixel show=[Overlay Masks] display exclude clear");

//Save into a .csv + .tiff with overlays
WindowName = getTitle();
WindowName = substring(WindowName, 0, lengthOf(WindowName) - 5)
Directory = getDirectory("image");
saveAs(WindowName+"_Adjusted.tiff", Directory + WindowName+"_Adjusted.tiff");

selectWindow("Results");
saveAs(WindowName+"_Results.csv", Directory+WindowName+"_Results.csv")