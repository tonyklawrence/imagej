var width = 50;

macro "Five [5]" { draw(5); }
macro "Three [3]" { draw(3); }

function draw(segments) {

roiManager("reset");

getSelectionCoordinates(x, y);
xinc = lengthOf(x) / segments;
yinc = lengthOf(y) / segments;

for (i = 0; i <= segments; i++) {
    xposition = startOf(x) + xinc * i;
    yposition = startOf(y) + yinc * i;
    
    makeLine(xposition - width, yposition, xposition + width, yposition);

    Roi.setName(100 / segments * i + "%");
    Roi.setStrokeColor("#cccccc");
    roiManager("Add");
}

function startOf(line) { return line[1]; }
function endOf(line) { return line[0]; }
function lengthOf(line) { return line[0] - line[1]; }

}
