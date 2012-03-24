color lightRed = color(#ffcccc);
color deepRed = color(#cc0000);
color lightBlue = color(#66bbcc);
color deepBlue = color(#334499);

int canvasWidth = 290;
int canvasHeight = 200;

int plotBorder = 10;
int plotWidth = canvasWidth - (plotBorder * 2);
int plotHeight = canvasHeight - (plotBorder * 2);

int barWidth = 5;

int energyLevels = 7;

void setup() {
	size(canvasWidth, canvasHeight);
	noStroke();
	background(#ffffff);
	for (int i=0; i < (plotWidth/barWidth); i++) {
		int e = int(random(energyLevels));
		int y = int(plotHeight*e/energyLevels);
		
		if (i < 15) {
			fill(lerpColor(deepBlue, lightBlue, y/plotHeight));
		} else {
			fill(lerpColor(deepRed, lightRed, y/plotHeight));
		}
		
		rect(plotBorder+i*barWidth, plotBorder+y, barWidth, plotHeight-y);
	}
}
