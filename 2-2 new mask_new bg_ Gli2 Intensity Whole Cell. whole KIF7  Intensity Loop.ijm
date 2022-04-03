run("Duplicate...", "title=C8-2.tif duplicate slices=6-31");
setBackgroundColor(0, 0, 0);
run("Clear Outside");
run("Split Channels");
roiManager("deselect");
roiManager("delete");
selectWindow("C2-C8-2.tif");
for (z=1;z<=nSlices;z++) {
	selectWindow("C2-C8-2.tif");
	setSlice(z);
	run("Subtract Background...", "rolling=100 disable");
	setThreshold(46,65535);
run("Create Selection");
roiManager("Add");
selectWindow("C2-C8-2.tif");
setSlice(z);
roiManager("Select", z-1);
run("Measure");
}