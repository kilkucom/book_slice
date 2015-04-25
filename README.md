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


## How it works
this is a very simple project for now :)
you nead to preper your file to slice
first fing you neead kieap in minnd
 * do not use atributs
![alt tag](https://github.com/kilkucom/book_slice/blob/master/matz/infogrPE1.png)

		you need to place the file, you want to work with, in Data directory and name it “file.svg”
    before you do this, prepare your .svg file in your favourite graphic application
    1. do not use any stroke attributes - if you use stroke, convert them into the shape
    2. shapes should not overlap each other - if they do so, fix it
    3. when file is ready, save it to .svg

    keep in mind
    this program is in beta stadium, so for now its doesn't support colors - the final file will contain only the black shapes
    program default units is px
    export only to *.pdf  

## Keyboard shortcuts

| nxame | key |
| :--- | :-- |
| [ Shift ] + [ r ] | reset workspace and zoom |
| [ Space ] or [ h ] or [ H ] + [ LMB ] | move/offset workspace |
`https://github.com/kilkucom/book_slice.git `
