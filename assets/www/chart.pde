color lightRed = color(#ffcccc);
color deepRed = color(#cc0000);
color lightBlue = color(#66bbcc);
color deepBlue = color(#334499);

final int energyLevelMax = 7;

/* Canvas */
final int canvasWidth = 290;
final int canvasHeight = 100;

/* Plot area */
final int plotBorder = 10;
final int plotWidth = canvasWidth - (plotBorder * 2);
final int plotHeight = canvasHeight - (plotBorder * 2);

/* Test data */
float[] time = [0.1, 0.2, 0.3, 0.5, 0.8, 0.85];
int[] energyLevels = [3, 5, 2, 6, 7, 5];

int plotX(t) {
	return plotBorder+t*plotWidth;
}

int plotY(e) {
	return plotBorder+plotHeight-(e/energyLevelMax*plotHeight);
}

void plotVertex(t, e) {
	vertex(plotX(0), plotY(e[0]));
	for (int i=0; i < t.length(); i++) {
		vertex(plotX(t[i]), plotY(e[i]));
	}
	vertex(plotX(1), plotY(e[t.length()-1]));
}

void setup() {
	size(canvasWidth, canvasHeight);
	background(#ffffff);
	
	fill(lightBlue);
	noStroke();
	beginShape();
	vertex(plotX(0), plotY(0));
	plotVertex(time, energyLevels);
	vertex(plotX(1), plotY(0));
	endShape();
	
	stroke(deepBlue);
	strokeWeight(2);
	noFill();
	beginShape();
	plotVertex(time, energyLevels);
	endShape();
}
