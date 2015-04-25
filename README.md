# Book Slice

### Program written in Processing for the project of the book Patterns of Europe
został zaprojektowany do ciecia grafiki vektorowej na potrzeby umieszczenia jej na
grzbiecie książki use of this program
## Installation
1. **Download Processing**
	    https://processing.org/download/

2. **Install External libraries**
	* run Processing
	* select **Sketch/Import Library/Add Library...**
and window that will popup,
	* type down and press install:
		* Geomerative
		* ControlP5

3. **Run project**
	* pull project from git or download the project and unzip it
	* open Processing window and go to **File/Open...**
	* navigate to a folder with your downloaded project and open *book_slice.pde*
	* run skeche by pressing Play button on top left corner of Processing window


## How to preper the file
this is a very simple project for now :)
you nead to preper your file to slice
ther is fiew fing you neead to kieap in minnd
 * do not use atributs like stoke alweis convert **stroke to path**
fings like color, gradient any efects like blur or glow well be ignor or my by cosw of cras and wrong interpretation

![alt tag](https://github.com/kilkucom/book_slice/blob/master/matz/infogrPE1.png)

 * do not owerlap shapes add them to gether or trim color while by ignor anyway
tray to keap final file as kleen as it posyble

![alt tag](https://github.com/kilkucom/book_slice/blob/master/matz/infogrPE2.png)

 * you need to place the file, you want to work with, in **data/** directory and name it **“file”** with extension **.svg**
 * keep in mind this program is in beta stadium, the final files will contain only the black shapes
 * program default units is px
 * export only to **.pdf**
 * after you run skech pres `i` to se shortcuts

## How its work
program simply load the file and divide it in to the number of slice
after thet slises they ar extrudet an redy to esport
after run the skech you will see your file loadet
on the left top corner you can ajust number of pages
size of extrusion and export area with is bay defolut set to size of you file bounding box
you can olsow save curent setings and load them `s` to save `l` to load,
using `LEFT` and `RUGHT` arrow you can change position of cliper its good idea to play a litle with yor garic to se if ther is any problem with the loadtet fill
its posible you well need to make som ajustemst in the grfic
and finaly press `e` to export
after the export ist redy you well finde your files in the project directory under **export/**
folder

be wery cerful with this program and do not send file to printer befor test printing
good luck


`https://github.com/kilkucom/book_slice.git `
