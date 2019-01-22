/* ///// Book slicer v01 /////
it is a simple script for preparing graphics on the back of a book
in order to work select grafick you whant to prepar
avoid multi pages project files and more then 1 layer
by kilku.com / Pafnucy Szarzyński
*/

var doc = app.activeDocument;
var objSelected = doc.selection;

// UI to set number of slises
// ==================================================
nr = Number(prompt( "Ilosc składek = ", 9));
var abOffset = Number(prompt("Ustaw artbord offset = ", 10));


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
workGroup.name = "nazwa_Grupy" + 1; // !!!!
for (i=0; i < objSelected.length; i++){
    // objSelected[i].move( workGroup, ElementPlacement.INSIDE);
    objSelected[i].move( workGroup, ElementPlacement.PLACEATEND);
}


// offset group to top left corner
// ==================================================
var bboxGroup = workGroup.geometricBounds;
workGroup.translate(bboxGroup[0]*-1,bboxGroup[1]*-1);


// add rectangle for cliping mask
// ==================================================
var bboxGroup = workGroup.geometricBounds; // !!!!
workGroup.pathItems.rectangle(0, 0, bboxGroup[2]/nr, bboxGroup[3]*-1);


// offset artboard to top left corner and resize to one slice size
// ==================================================
var bboxGroup = workGroup.geometricBounds;
var width = bboxGroup[2];
var height = bboxGroup[3];
var bboxAb = doc.artboards[0].artboardRect;// left, top, right, bottom
var firstAbx = bboxAb[0] - bboxAb[0];
var firstAby = bboxAb[1] - bboxAb[1];
var firstAbw = width/nr;
var firstAbh = height;

doc.artboards[0].artboardRect = [firstAbx, firstAby, firstAbw, firstAbh];


// Layers duplicate //
// ==================================================
var workLayer = doc.activeLayer ;
workLayer.name = (nr-1).toString();

for(i=0; i < nr-1; i++){
    with(doc) {

        var n=doc.layers.length;
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
        doc.layers.getByName(i.toString()).move(doc.layers[n-x], ElementPlacement.PLACEAFTER);
    }
}


// Arbord setup //
// ==================================================
var artboard = doc.artboards[0];
var mainAbSize = doc.artboards[0].artboardRect;
artboard.name = "joint 0";

var abPosx = mainAbSize[2];
var abPosy = mainAbSize[1];
var abPosw = mainAbSize[2];
var abPosh = mainAbSize[3];

for(i=1; i < nr; i++){
    var ABrect = artboard.artboardRect;
    var newAB = doc.artboards.add(ABrect);
    doc.artboards[i].artboardRect = [ abPosx * ( i ), abPosy, abPosw * ( i + 1 ), abPosh ];
    newAB.name = "joint " + ( i + 1 );
}


// arboard offset by abOffset value //
// ==================================================
var artbord = doc.artboards;
for( i=0; i <artbord.length; i++ ){
    doc.artboards[i].artboardRect = [doc.artboards[i].artboardRect[0] + ( abOffset * i),doc.artboards[i].artboardRect[1], doc.artboards[i].artboardRect[2] + ( abOffset * i),doc.artboards[i].artboardRect[3]];
}


// layer offset by abOffset value //
// ==================================================
for(i=0; i < app.activeDocument.layers.length; i++){
     app.activeDocument.layers[i].groupItems[0].translate(abOffset * i, app.activeDocument.layers[0].groupItems[0].geometricBounds[1] );
}

MakeClipingMask();

// ajust cliping mask

for(x=0; x < doc.layers.length; x++){
    var warstwa = doc.layers[x];

    warstwa.groupItems[0].pathItems[0].translate(firstAbw*x,0,true,true);

}

// ==================================================
///// Expand Funcion /////
function expandFile() {
  app.executeMenuCommand("selectall");
  app.executeMenuCommand ('Live Outline Stroke');
  app.executeMenuCommand ('expandStyle');
}

// ==================================================
///// Clipin gmask Function /////
function MakeClipingMask(){

    for(x=0; x < doc.layers.length; x++){
        var lr = doc.layers[x];
        var thisGroup = lr.groupItems[0];
        // doc.selection = null;
        thisGroup.selected = true;
        thisGroup.clipped = true;
    }
}
