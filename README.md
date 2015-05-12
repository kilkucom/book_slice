# Book Slice

### Program written in Processing for the project of the book Patterns of Europe
The program is designed to slice vector graphic in order to put it on sides of a book block.

## Installation
1. **Download Processing**
	    https://processing.org/download/

2. **Install External libraries**
	* Run Processing
	* Select **Sketch/Import Library/Add Library...**
and in window that will popup,
	* Type down and press install:
		* Geomerative
		* ControlP5

3. **Run project**
	* Pull project from git or download the project and unzip it
	* Open Processing window and go to **File/Open...**
	* Navigate to a folder with your downloaded project and open *book_slice.pde*
	* Run sketch by pressing Play button on the top left corner of Processing window


## How to prepare the vector file
This is a very simple project for now :)
While preparing a vector graphic file, which you want to place on sides of your book block, you need to keep in mind a few things.
 * Do not use stroke attribute! Always convert **stroke to path.**
All attributes (e.g. color, gradient) and effects (e.g. blur, glow) will be ignored and may cause errors or crash of the program.

![alt tag](https://github.com/kilkucom/book_slice/blob/master/matz/infogrPE1.png)

 * Do not overlap shapes! All overlapping objects convert to one shape (Pathfinder -> Add) or separate shapes (Pathfinder -> Trim). Remember that color will be ignored anyway. Try to keep the final file as clean as possible.

![alt tag](https://github.com/kilkucom/book_slice/blob/master/matz/infogrPE2.png)

 * Place the final vector file in **data/** directory and name it **“file”** with extension **.svg**
 * Keep in mind that the final files will contain only the black shapes (this program is in beta stadium)
 * Program default units is px
 * Export only to **.pdf**
 * After you run sketch, press `i` to see shortcuts

## How does it work
Program simply loads the vector file and divides contained graphic into slices. Each slice is extruded and prepared for export.
After runnning the sketch, you will see your vector file loaded. On the top left corner of the window you can adjust the number of pages, size of extrusion and export area, which is, by default, set to size of your file's bounding box. You may also save current settings with `s` and load them with `l` button. By using `LEFT` and `RIGHT` arrow, you can change position of the clipper. It's a good idea to check carefully your graphic, to see if there is any problem with the loaded file - it is possible that you will need to make some adjustments in the graphic. When everything is ready, press `e` to export. You will find exported files under the project directory in **export/** folder.

Remember: this is a beta version of the program and you should be  carefull while using it. We strongly recommend to make a test printing before sending final files to a printing house.

Good luck


`https://github.com/kilkucom/book_slice.git `
