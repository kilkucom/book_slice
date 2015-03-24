color bg_color = color(255);

//	declare variables workspace setup
//	zoom
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;


void setup(){

	// set widows size to size of screen
	size(displayWidth, displayHeight);

	// enable Resizable of program windows screen 
	if( frame != null){
		frame.setResizable(true);
	}

	// init workscpace setup 
	zoom = 1.0;
	offset = new PVector((displayWidth-250)/2,500);
	poffset = new PVector(0, 0);
}

void draw(){
	background(bg_color);

	//	sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);


	noFill();
	stroke(0);
	point(0,0);
	strokeWeight(1);
	ellipse(0, 0, 5, 5);
	ellipse(0, 0, 10, 10);
	ellipse(0, 0, 15, 15);
	ellipse(0, 0, 20, 20);


	popMatrix();
	// sklalowanie przesuwanie przestrzenią roboczą [ STOP ]

	b_info_bar();
}