// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';
// Common Colors //
@water: #c3e6ff;
@park: #cec;

Map {
  background-color:#ddd;
  background-image:url("textures/paper-texture.jpg");
}

// Water Features //
#water {
  polygon-fill: @water;
  polygon-gamma: 0.6;
  polygon-pattern-file: url("textures/water.jpg");
  comp-op: multiply;
  ::shadow{
    polygon-fill: #fff;
    polygon-opacity:0.7;
    image-filters: agg-stack-blur(20,20);
	comp-op: screen;
  }
}
#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

// Parks //
#landuse {
  [class='park'] {
     ::texture{
  		polygon-pattern-file: url("textures/green.jpg");	
    }
  }
}

// Roads & Railways //
#bridge {
  ::shadow{
    line-color: #000;
    line-width: 8;
    line-geometry-transform: "translate(0, 0)";
    comp-op: multiply;
    image-filters: agg-stack-blur(5,5);
    opacity:0.3;
  }
  ::road{
    line-color: #fff;
    line-width: 4;
    comp-op: screen;
    opacity:0.5;
  }
}

#road,
#tunnel,
#bridge {
    line-color: #000;
    line-width: 1;
    comp-op: multiply;
    opacity:0.2;
   	line-simplify:1;
  	line-smooth: 1;
    [class='motorway'],
    [class='main'] {
      [zoom>=12] {line-width:2}
      [zoom>=14] {line-width:3}
      [zoom>=16] {line-width:5}
    }
    [class='street'],
    [class='street_limited'] {
    	[zoom>=3] {line-width:2}
      	[zoom>=16]{line-width:5}
 	}
  	
  ::inset{
    	line-color:#fff;
      	line-width:1;
      	line-offset:0;
       	line-simplify:1;
  		line-smooth: 1;
     	line-geometry-transform: "translate(2, 0)";
        image-filters: agg-stack-blur(1,1);
    	[zoom<=5] {line-width:0}

    }
}
/* Buildings */
#building {
 [zoom>=14] {
    building-height: -1;
    polygon-fill:#666;
    polygon-gamma:0;
	comp-op:  hard-light;
    opacity:0.4
  }
}
