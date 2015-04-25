// bottom info bar

void info_bar(){
	color bib_color = color(255);
	color bit_color = color(0);

	float bib_x = 25;
	float bib_y = 25;
	float bib_h = 25;

	fill(bib_color);
	noStroke();

	// textFont(font, 12);

	rect(0, height - bib_x, width, bib_x);

	fill(bit_color);
	text(" fps – " +
	int(frameRate) +
	"  |-|  bbox [0] " + bbox[0].x +	" – " + bbox[0].y + " bbox [2] " + bbox[2].x + " – " + bbox[2].y +
	"  |-|  clip " + clip +
	"  |-|  clip_to " + clip_to + 
	"  |-|  clip_from " + clip_from + 
	"  |-|  clip_counter " + clip_counter + 
	"  |-|  page_nr " + page_nr +
	"  |-|  intersection " + intersection.size() +
	"  |-|  extrude_size " + extrude_size 

	,25, height - bib_x + ( 30/2 ));
}

void info_panel(){
	float w = 800;
	float h = 400;
	float o = 5;

	pushMatrix();
	translate( (width-w)/2, (height-h)/2 );

	fill(0);
	rect(0+o, 0+o, w+o, h+o);
	fill(255);
	stroke(0);
	strokeWeight(1);
	rect(0, 0, w, h);

	noStroke();
	shape(info_screen,0,0);




	popMatrix();
}

void new_rect(float _x, float _y, float _w, float _h, float _offset, String _n, float _s){
	float x = _x;
	float y = _y;
	float w = _w;
	float h = _h;
	float o = _offset;
	String n = _n;
	float s = _s;


	// fill(0);
	// rect( x+o, y+o, w, h );

	// fill(59, 141, 176);
	// // stroke(0);
	// // strokeWeight(1);
	
	// rect(x,y,w,h);
	// fill(0);
	// noStroke();

	// text(n,x+o,y+(h+7)/2);
	// text(s,x+(w/2),y+(h+7)/2);

}

void pointer(float _x, float _y, float _len){

	noFill();
	strokeWeight(0.5);
	stroke(0);

	line(_x - _len, _y - _len, _x + _len, _y + _len);
	line(_x - _len, _y + _len, _x + _len, _y - _len);
	ellipse(_x, _y, _len, _len);
	// ellipse(_x, _y, ( _len * 2), ( _len * 2));

} 

void pointer(float _x, float _y, float _len, int _nr, String _name, int _dir){

	noFill();
	strokeWeight(0.5);
	stroke(0);

	line(_x - _len, _y - _len, _x + _len, _y + _len);
	line(_x - _len, _y + _len, _x + _len, _y - _len);
	for ( int i = 0; i < _nr; i++){
		ellipse(_x, _y, _len*(i+1), _len*(i+1));
	}
	// ellipse(_x, _y, ( _len * 2), ( _len * 2));
	if( _dir == 0){
		textAlign(LEFT);
		text(_name, _x + (_len*3), _y - (_len*3) );
		line(_x, _y, _x + (_len*3), _y - (_len*3));
	}
		
	if( _dir == 1){
		textAlign(LEFT);
		text(_name, _x + (_len*3), _y + (_len*3) );
		line(_x, _y, _x + (_len*3), _y + (_len*3));

	}

	if( _dir == 2){
		textAlign(RIGHT);
		text(_name, _x - (_len*3), _y + (_len*3) );
		line(_x, _y, _x - (_len*3), _y + (_len*3));
	}

	if( _dir == 3){
		textAlign(RIGHT);
		text(_name, _x - (_len*3), _y - (_len*3) );
		line(_x, _y, _x - (_len*3), _y - (_len*3));
	}

} 

void spointer(float _x, float _y, float _len){

	noFill();
	strokeWeight(0.5);
	stroke(0);

	line(_x - _len, _y - _len, _x + _len, _y + _len);
	line(_x - _len, _y + _len, _x + _len, _y - _len);

} 