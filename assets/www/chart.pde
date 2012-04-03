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

ArrayList energyLevels = new ArrayList();

class EnergyLevel {
	float time;
	int energy;
	
	EnergyLevel(float t, int e) {
		this.set(t, e);
	}
	
	void set(float t, int e) {
		if (t < 0) t = 0;
		if (t > 1) t = 1;
		if (e < 1) e = 1;
		if (e > energyLevelMax) e = energyLevelMax;
		time = t;
		energy = e;
	}
}

int plotX(t) {
	return plotBorder+t*plotWidth;
}

int plotY(e) {
	return plotBorder+plotHeight-(e/energyLevelMax*plotHeight);
}

void plotVertex(e) {
	vertex(plotX(0), plotY(e.get(0).energy));
	for (int i=0; i < e.size(); i++) {
		vertex(plotX(e.get(i).time), plotY(e.get(i).energy));
	}
	vertex(plotX(1), plotY(e.get(e.size()-1).energy));
}

void loadData(String date) {
	energyLevels.clear();
	String[] exp = split(expData, "\n");
	for (int i = 0; i < exp.length(); i++) {
		if (exp[i] == "") continue;
		String[] tokens = split(exp[i], ",");
		if (tokens.length < 3) continue;
		String[] dt = split(tokens[1], " ");
		if (dt[0] != date) continue;
		String[] hms = split(dt[1], ":");
		int t = (int(hms[0])*60+int(hms[1]))*60+int(hms[2]);
		energyLevels.add(new EnergyLevel(t/86400, (int) tokens[2]));
	}
}

void setup() {
	size(canvasWidth, canvasHeight);
	noLoop();
}

void draw() {
	background(#ffffff);
	
	fill(lightBlue);
	noStroke();

	beginShape();
	vertex(plotX(0), plotY(0));
	plotVertex(energyLevels);
	vertex(plotX(1), plotY(0));
	endShape();

	stroke(deepBlue);
	strokeWeight(2);
	noFill();
	
	beginShape();
	plotVertex(energyLevels);
	endShape();
}

void drawData(selDate) {
	loadData(selDate);
	redraw();
}
