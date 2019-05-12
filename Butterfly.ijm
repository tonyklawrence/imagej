/*
 * Segmentation of RGB butterfly wind based on Brightness
 * And Convex Hull
 * 
 * By Olivier Burri, EPFL BIOP for
 * Nigel Haywood, in image.sc forum
 * link: https://forum.image.sc/t/butterfly-wing-shape-analysis/19335/3?u=oburri
 */

// Pick up original image
scale = 2;
run("Scale...", "x="+(1/scale)+" y="+(1/scale)+" interpolation=Bilinear create");
ori = getTitle();

roiManager("Reset");
setBatchMode(true);
run("Duplicate...", "title=Mask");
run("8-bit");
run("Median...", "radius=20");
setAutoThreshold("Percentile");
run("Create Mask");
run("Fill Holes");
setAutoThreshold("Default dark");
run("Create Selection");
run("Convex Hull");
setForegroundColor(255, 255, 255);
run("Fill", "slice");

run("Set Measurements...", "area centroid display redirect=None decimal=3");

run("Analyze Particles...", "display");
selectImage(ori);
run("Restore Selection");
run("Properties... ", "  stroke=blue width=3");
setBatchMode(false);