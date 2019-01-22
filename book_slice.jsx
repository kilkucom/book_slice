/* ///// Book slicesr v01 /////
it is a simple script for preparing graphics on the back of a book
in order to work select grafick you whant to prepar
avoid multi pages project files and more then 1 layer
by kilku.com / Paweł Szarzyński
*/

var doc = app.activeDocument;
var objSelected = doc.selection;

// UI to set number of slises
// ==================================================
nr = Number(prompt( "Ilosc składek = ", 5));



// Expand all selected object one by one
// ==================================================
for (i=0; i < objSelected.length; i++){
    objSelected[i] = expandFile();
}



// re-select expand obj
// create and re-name group
// add objSelected (selected object ) to created group
// ==================================================
var objSelected = doc.selection;
var workGroup = app.activeDocument.groupItems.add();
workGroup.name = "nzawa_Grupy" + 1;
for (i=0; i < objSelected.length; i++){
    objSelected[i].move( workGroup, ElementPlacement.INSIDE);
    objSelected[i].move( workGroup, ElementPlacement.PLACEATEND);
}



// offset group to top left corner
// ==================================================
var mainGroup = workGroup.geometricBounds;
workGroup.translate(mainGroup[0]*-1,mainGroup[1]*-1);



// offset artboard to top left corner and resize to one slice size
// ==================================================
var mainGroup = workGroup.geometricBounds;
var width = mainGroup[2];
var height = mainGroup[3];
var abBounds = doc.artboards[0].artboardRect;// left, top, right, bottom
var firstAbx = abBounds[0] - abBounds[0];
var firstAby = abBounds[1] - abBounds[1];
var firstAbw = width/nr;
var firstAbh = height;
doc.artboards[0].artboardRect = [firstAbx, firstAby, firstAbw, firstAbh];



// Layers duplicate //
// ==================================================
var docRef = app.activeDocument;
var workLayer = docRef.activeLayer ;
workLayer.name = (nr-1).toString();

for(i=0; i < nr-1; i++){
    with(docRef) {

        var n=docRef.layers.length;
        x=workLayer.zOrderPosition;
        var ln=workLayer.name;
        var ol = layers.getByName(ln);
        // workLayer.visible = false;
        var nl = layers.add();
        var nname = "Layer";
        var fullName = nname;
        nl.name = i.toString();
        for (var a = ol.pageItems.length-1; a >= 0; a--) {
            ol.pageItems[a].duplicate(nl, ElementPlacement.PLACEATBEGINNING);
            nl.visible = true;
        }
        docRef.layers.getByName(i.toString()).move(docRef.layers[n-x], ElementPlacement.PLACEAFTER);
    }
}


var idoc = app.activeDocument;

var artboard = doc.artboards[0];
// idoc.artboards.artboardRect = [50, 50, 50, 50];
for(i=0; i < ( nr - 1 ); i++){
    var ABrect = artboard.artboardRect;
    var newAB = doc.artboards.add(ABrect);
    doc.artboards[i].artboardRect = [doc.artboards[0].artboardRect[0]*(i+1), doc.artboards[0].artboardRect[1], doc.artboards[0].artboardRect[2]*(i+1), doc.artboards[0].artboardRect[3]];

}
//




// ==================================================
///// Expand Funcion /////
function expandFile() {
  app.executeMenuCommand("selectall");
  app.executeMenuCommand ('Live Outline Stroke');
  app.executeMenuCommand ('expandStyle');
}
