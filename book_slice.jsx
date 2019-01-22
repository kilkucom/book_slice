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
workGroup.name = "nzawa_Grupy" + 1;
for (i=0; i < objSelected.length; i++){
    objSelected[i].move( workGroup, ElementPlacement.INSIDE);
    objSelected[i].move( workGroup, ElementPlacement.PLACEATEND);
}


// var objSelected = doc.selection;

// offset group to top left corner
// ==================================================
var mainGroup = workGroup.geometricBounds;
workGroup.translate(mainGroup[0]*-1,mainGroup[1]*-1);



// add rectangle for cliping mask
// ================================================== !!!
workGroup.pathItems.rectangle ( 0, 0, 5, 500);



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
//

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
};



// arboard offset by abOffset value //
// ==================================================
var artbord = doc.artboards;
for( i=0; i <artbord.length; i++ ){
    doc.artboards[i].artboardRect = [doc.artboards[i].artboardRect[0] + ( abOffset * i),doc.artboards[i].artboardRect[1], doc.artboards[i].artboardRect[2] + ( abOffset * i),doc.artboards[i].artboardRect[3]];
};



// layer offset by abOffset value //
// ==================================================

// for(i=0; i , )
alert("Layers nr = " + app.activeDocument.layers.length);
alert("aa = " + app.activeDocument.layers[0].groupItems[0].geometricBounds);

for(i=0; i < app.activeDocument.layers.length; i++){
     app.activeDocument.layers[i].groupItems[0].translate(abOffset * i, app.activeDocument.layers[0].groupItems[0].geometricBounds[1] );
}

MakeclipingMask();


// ==================================================
///// Expand Funcion /////
function expandFile() {
  app.executeMenuCommand("selectall");
  app.executeMenuCommand ('Live Outline Stroke');
  app.executeMenuCommand ('expandStyle');
}

// ==================================================
    ///// Cliping Mask Funcion /////
function MakeclipingMask(){
    // if(app.documents.length < 1){
    //     return;
    // }
    var doc = app.activeDocument;
    for(x=0; x < doc.layers.length; x++){
        var lr = doc.layers[x];
        for(var i=0; i<lr.groupItems.length; i++){
            var thisGroup = lr.groupItems[i];
            doc.selection = null;
            thisGroup.selected = true;
            for(var j=0; j<doc.pageItems.length; j++){
                var thisItem = doc.pageItems[j];
                if(thisItem.selected){
                    thisGroup.clipped = true;
                    // thisItem.clipping = true;
                    if(thisItem.typename == "PathItem" && thisItem.name == "proofLine"){
                    }
                }
            }
        }
    }
}
