run("Duplicate...", "title=N8-2.tif duplicate slices=10-31");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("Split Channels");
selectWindow("C1-N8-2.tif");
roiManager("deselect");
roiManager("delete");
for (z=1;z<=nSlices;z++) {
	selectWindow("C1-N8-2.tif");
	setSlice(z);
	run("Subtract Background...", "rolling=100 disable");
	setThreshold(51,65535);
run("Create Selection");
roiManager("Add");
selectWindow("C2-N8-2.tif");
setSlice(z);
roiManager("Select", z-1);
run("Measure");
}
