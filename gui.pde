ControlP5 cp5; // declare class form 'controlP5' external libery to create gui

class Gui{
	Gui(){

		float posx = (30);
		float posy = 20;
		int w = 100;
		int h = 15;
		int o = 15;


		cp5.setColorLabel(#000000);
		cp5.setColorForeground(#000000);
		cp5.setColorBackground(#7F7F7F);
		cp5.setColorActive(#000000);
		cp5.setFont(createFont("Verdana",9));



		cp5.addNumberbox("page_nr")
			.setPosition(posx,(posy+o))
			.setSize(w,h)
			.setScrollSensitivity(1000)
			.setRange(1,1000)
			;

		cp5.addNumberbox("extrude_size")
			.setPosition(posx,(posy+o)*2)
			.setSize(w,h)
			.setScrollSensitivity(1000)
			.setRange(0,1000)
			;

	cp5.addNumberbox("export_wight")
			.setPosition(posx,(posy+o)*3)
			.setSize(w,h)
			.setScrollSensitivity(1000)
			.setRange(0,1000)
			;
	
	cp5.addNumberbox("export_height")
			.setPosition(posx,(posy+o)*4)
			.setSize(w,h)
			.setScrollSensitivity(1000)
			.setRange(0,1000)
			;
	}
}

// export_wight