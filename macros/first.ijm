segments = 5;
width = 100;

getSelectionCoordinates(x, y);
xinc = (x[0] - x[1]) / segments;
yinc = (y[0] - y[1]) / segments
roiManager("reset");

for (i = 0; i <= segments; i++) {
    xcoord = x[0] - xinc * i;
    ycoord = y[0] - yinc * i;
    makeLine(0, width, width, width);
    linex = xcoord - width / 2;
    
    Roi.setName(100 / segments * i + "%");
    Roi.move(linex, ycoord);
    roiManager("Add");
}
