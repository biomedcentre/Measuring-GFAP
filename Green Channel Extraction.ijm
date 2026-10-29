// A short macro to extract the green channel from an RGB image and save it ot a given forlder
////MP 02.10.26

// get the number of opened windows and extract green channels from all of them 
nOpenImages = nImages;
dirPath = getDirectory("Choose a Directory to Process");

for (i = 0; i < nOpenImages; i++) {
	
	WindowName = getTitle();
	run("Split Channels");
	selectImage(WindowName + " (red)");
	close;
	selectImage(WindowName + " (blue)");
	close;
	selectImage(WindowName + " (green)");
	
	// This opens a window specifically designed to select a directory
	WindowName = substring(WindowName, 0, lengthOf(WindowName) - 4);
	saveAs("Tiff", dirPath + WindowName + ".tiff");
	close;
}
	

