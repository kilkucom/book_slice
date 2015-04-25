void keyPressed(){

  if ( key == 's' ) {
    println("[ Save ]");
    println(colect_verb_to_save);
    saveStrings("save.txt", file_save);
    println("[ Save Done !!!]");
  }

  
  if ( key == 'l' ) {
    println("[ Load ]");
    String verb_to_load[] = loadStrings("save.txt");
    page_nr = int(verb_to_load[0]);
    extrude_size = float(verb_to_load[1]);
    export_wight = int(verb_to_load[2]); 
    export_height = int(verb_to_load[3]);
    
    for (int i = 0 ; i < verb_to_load.length; i++) {
      println(verb_to_load[i]);
    }

    println("[ Load Done !!!]");
  }


  if ( key == '9') {
    extrude_size--;
  }

  if ( key == '0') {
    extrude_size++;
  }

  if ( key == 'R' || key == 'r' ) {
    zoom = 1;
    offset.x = 0;
    offset.y = 0;
  }

  if (key == 'h' || key == 'H' || key == ' ') {
    drag = true;
  } else {
    drag = false;
  }

  if (key == '+') {
    zoom += 0.1;
  } else if (key == '_') {
    zoom -= 0.1;
  }

  if ( key == 'E' || key == 'e' ) {
    ex = true;
  }

  if ( keyCode == LEFT ) {
    clip_counter--;
  }

  if ( keyCode == RIGHT ) {
    clip_counter++;
  }

  if ( keyCode == UP ) {
    page_nr++;
  }

  if ( keyCode == DOWN ) {
    page_nr--;
  }

  if ( key == 'i' ) {
    info = true;
  }
  

}

void keyReleased() {
	if (key == 'h' || key == 'H' || key == ' ') {
		drag = false;
	}
  if ( key == 'i' ) {
    info = false;
  }
}

void mousePressed() {
  if ( drag == true) {
    mouse = new PVector(mouseX, mouseY);
    poffset.set(offset);
  }
}

// Calculate the new offset based on change in mouse vs. previous offsey
void mouseDragged() {
  if ( drag == true) {
    offset.x = mouseX - mouse.x + poffset.x;
    offset.y = mouseY - mouse.y + poffset.y;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if ( e == -1.0) {
    zoom += 0.1;
  }
  if (e == 1.0) {
    zoom -= 0.1;
  }
  if (zoom <= 0.1) {
    zoom = 0.1;
  }
}
