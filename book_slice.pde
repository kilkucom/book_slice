// [ external liberys ]
import geomerative.*;
import processing.pdf.*;
import controlP5.*;
import java.util.*;

color color_bg = color(255);
PFont font;

RShape load_shape;
RPoint bbox[];
PShape info_screen;

PGraphicsPDF pdf;
Gui gui;

boolean ex = false;
boolean info = false;


// int first_step_size = 0;
int second_step_size = 100;
// int third_step_size

// extrude veriebals
float extrude_size = 20;

// save options

String[] verb_to_save = new String[4];
String[] verb_to_load = new String[4];
String colect_verb_to_save;
String[] file_save;

//	declare variables workspace setup
//	zoom
float zoom;
PVector offset;
PVector poffset;
PVector mouse;
boolean drag = false;

float clip = 0;					// pozycja linia przeciecia
float clip_from = 0;			
float clip_to = 100;
int clip_counter = 0;
int page_nr = 100;
int export_wight = 100; 
int export_height = 100; 

ArrayList<Float> intersection;


void setup(){

	// -----  -----  -----  -----  ----- set widows size to size of screen
	// -----  -----  -----  -----  ----- enable Resizable of program windows screen
	size(displayWidth, displayHeight);

	// frameRate(25);

	font = loadFont("CourierNewPS-ItalicMT-12.vlw");
	info_screen = loadShape("lgendaBookSlice.svg");

	if( frame != null){
		frame.setResizable(true);
	}


	// -----  -----  -----  -----  ----- gui
	noStroke();
	cp5 = new ControlP5(this);
	gui = new Gui();



	// -----  -----  -----  -----  ----- init workscpace setup
	zoom = 1.0;
	offset = new PVector((displayWidth)/2,50);
	poffset = new PVector(0, 0);

	RG.init(this);            
	// RG.setPolygonizer(RG.ADAPTATIVE);
	load_shape = RG.loadShape("file.svg"); // <--- <--- <--- [ File ]
	load_shape.scale(0.80000005,0.80000005);
	bbox = load_shape.getBoundsPoints();


}

void draw(){
	background(color_bg);


	int(export_wight * 0.8);
	int(export_height * 0.8);

	pdf = (PGraphicsPDF) createGraphics(int(export_wight),int(export_height), PDF, "export/ex" + nf(clip_counter,4) + ".pdf");

	// -----  -----  -----  -----  ----- save
	verb_to_save[0] = str(page_nr);
	verb_to_save[1] = str(extrude_size);
	verb_to_save[2] = str(export_wight);
	verb_to_save[3] = str(export_height);


	colect_verb_to_save = join(verb_to_save," ");
	file_save = split(colect_verb_to_save, ' ');

	// -----  -----  -----  -----  ----- gui
	cp5.controller("page_nr").setValue(page_nr);
	cp5.controller("extrude_size").setValue(extrude_size);
	cp5.controller("export_wight").setValue(export_wight);
	cp5.controller("export_height").setValue(export_height);

	// -----  -----  -----  -----  ----- zaincjalizuj pust 'ArrayList'
	intersection = new ArrayList<Float>();

	// -----  -----  -----  -----  ----- sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);


	clip_from = bbox[0].x;
	clip_to = bbox[1].x;
	clip = lerp( clip_from, clip_to, map(clip_counter, 0, page_nr, 0, 1) );


	pushMatrix();
	translate( -(bbox[1].x + second_step_size), 0 );

	// -----  -----  -----  -----  ----- display loadet shape
	RG.shape(load_shape,0,0);

	// -----  -----  -----  -----  ----- display clip line
	RShape cuttingLine = RG.getLine(clip,0,clip,bbox[2].y);
	RG.shape(cuttingLine);

	pointer(clip,0,10,1,"cliper",3);
	pointer(clip,bbox[2].y,10,1,"cliper",2);

	// -----  -----  -----  -----  ----- get intersection of loaddet shape and line
	RPoint[] ps = load_shape.getIntersections(cuttingLine);
		if (ps != null) {
		for (int i=0; i<ps.length; i++) {
			spointer(ps[i].x, ps[i].y, 2);
			intersection.add(ps[i].y);
    	}
  	}

	noFill();
	stroke(255,0,0);
	strokeWeight(1);


	//
	
	popMatrix();

	// -----  -----  -----  -----  -----

	pushMatrix();

	translate( -( second_step_size/2 ),0);

	noStroke();
	fill(0);

  	Collections.sort(intersection);

	stroke(0);
	strokeWeight(1);

	println(intersection.size());
	if( intersection.size() != 0){
		for( int i = 0; i < (intersection.size()-1); i+=2){
	  		line(0,intersection.get(i),0,intersection.get(i+1));
	  	}
	}

	popMatrix();
	if(ex == true){
	    zoom = 1;
	    offset.x = 0;
	    offset.y = 0;
		beginRecord(pdf);
	}
	rect(0, 0, 100, 100);

	if( intersection.size() != 0){
		simple_extrude(intersection,extrude_size);
	}

	if(ex == true){
		clip_counter++;
		endRecord();
	}



	popMatrix();
	// -----  -----  -----  -----  ----- sklalowanie przesuwanie przestrzenią roboczą [ STOP ]

	// info_bar();




	if(clip_counter == page_nr){
		ex = false;
		clip_counter = 0;
	    offset.x = width/2;
	    offset.y = 50;
	}

	if(clip_counter <= 0){
		clip_counter = 0;
	}

	// -----  -----  -----  -----  ----- sklalowanie przesuwanie przestrzenią roboczą [ START ]
	pushMatrix();
	scale(zoom);
	translate(offset.x/zoom, offset.y/zoom);

	pushMatrix();
	translate( -(bbox[1].x + second_step_size), 0 );

	popMatrix();
	pointer(0, 0, 10, 2, str(0) + " x " + str(0) + " y" , 3);
	pointer(export_wight, 0, 10, 2, str(export_wight) + " x " + str(0) + " y" , 0);
	pointer(export_wight, export_height, 10, 2, str(export_wight) + " x " + str(export_height) + " y" , 1);
	pointer(0, export_height, 10, 2, str(0) + " x " + str(export_height) + " y" , 2);
	popMatrix();

	if( info == true){
		info_panel();
	}

	if(ex == true){
		pop_up();
	}

}


void simple_extrude(ArrayList<Float> _in, float _extrude_size){

	fill(0);
	noStroke();
	for( int i = 0; i < (_in.size()-1); i+=2){
		beginShape();
		vertex(0,_in.get(i));
		vertex( _extrude_size, _in.get(i) );
		vertex( _extrude_size, _in.get( i+1 ) );
		vertex(0, _in.get( i+1 ) );
		endShape(CLOSE);
	}

}

void pop_up(){

	float w = 300;
	float h = 20;

	pushMatrix();
	translate( (width-w)/2, (height-h)/2);
	
	fill(0);
	rect(0+5,0+5,w,h);
	
	fill(255);
	stroke(0);
	strokeWeight(1);
	
	rect(0,0,w,h);
	fill(0);
	noStroke();
	
	textAlign(CENTER);
	text("EXPORT PAGE NR " + clip_counter,w/2,(h+5)/2);

	popMatrix();


}