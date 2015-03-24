void keyPressed(){

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

}

void keyReleased() {
	if (key == 'h' || key == 'H' || key == ' ') {
		drag = false;
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
