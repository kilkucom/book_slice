// bottom info bar
void b_info_bar(){
	color bib_color = color(255);
	color bit_color = color(0);

	float bib_x = 25;
	float bib_y = 25;
	float bib_h = 25;

	fill(bib_color);
	noStroke();

	rect(0, height - bib_x, width, bib_x);

	fill(bit_color);
	text("   fps   [ " +
	int(frameRate) +
	" ]   |#|" + 
	"   bbox   [ " +
	bbox[0].x +
	" ] x  [ " +
	bbox[0].y +
	" ] y  [ " + 
	bbox[2].x +
	" ] x  [ " +
	bbox[2].y +
	" ] y  " + 
	" |#|" 



	,25, height - bib_x + ( 30/2 ));


}