// [ external liberys ]
import geomerative.*;
import processing.pdf.*;

color color_bg = color(255);


RShape load_shape;

RPoint bbox[];

//	declare variables workspace setup
//	zoom
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;


void setup(){

	// -----  -----  -----  -----  ----- set widows size to size of screen
	// -----  -----  -----  -----  ----- enable Resizable of program windows screen
	size(displayWidth, displayHeight);

	if( frame != null){
		frame.setResizable(true);
	}

	// -----  -----  -----  -----  ----- init workscpace setup
	zoom = 1.0;
	offset = new PVector((displayWidth-250)/2,500);
	poffset = new PVector(0, 0);

	RG.init(this);
	RG.setPolygonizer(RG.ADAPTATIVE);
	load_shape = RG.loadShape("file.svg"); // <--- <--- <--- [ File ]
	// load_shape.scale(1,1);
	bbox = load_shape.getBoundsPoints();


}

void draw(){
	background(color_bg);

	// -----  -----  -----  -----  ----- sklalowanie przesuwanie przestrzenią roboczą [ START ]

	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);

	// -----  -----  -----  -----  ----- display loadet shape
	noFill();
	stroke(255,0,0);
	strokeWeight(2);
	rect(bbox[0].x, bbox[0].y,bbox[2].x,bbox[2].y);
	stroke(0);
	strokeWeight(1);
	rect(0,0,141.732283,850.393701);
	RG.shape(load_shape,0,0);


	popMatrix();
	// -----  -----  -----  -----  ----- sklalowanie przesuwanie przestrzenią roboczą [ STOP ]

	b_info_bar();
}
