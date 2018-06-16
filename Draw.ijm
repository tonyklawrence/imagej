var width = 50;

macro "Five [5]" { draw(5); }
macro "Three [3]" { draw(3); }

function draw(segments) {

roiManager("reset");

getSelectionCoordinates(x, y);
segmentWidth = lengthOf(x) / segments;
segmentHeight = lengthOf(y) / segments;

for (i = 0; i <= segments; i++) {
    xposition = startOf(x) + segmentWidth * i;
    yposition = startOf(y) + segmentHeight * i;

    makeLine(xposition - width, yposition, xposition + width, yposition);

    Roi.setName("At " + asPercent(100 / segments * i));
    Roi.setStrokeColor("#cccccc");
    roiManager("Add");

    if (i != segments) {
        makeLine(xposition, yposition, xposition, yposition + segmentHeight);
        Roi.setName("Measurement is " + abs(segmentHeight));
        Roi.setStrokeColor("#eeeeee");
        roiManager("Add");
    }
}

function startOf(line) { return line[1]; }
function endOf(line) { return line[0]; }
function lengthOf(line) { return line[0] - line[1]; }
function asPercent(value) { return "" + value + "%"; }

}
