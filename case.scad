//size of the finished case
case_w = 60;
case_l = 100;
case_h = 10;
wall_thickness=1.5;

//width of the dxf is set by potrace
pattern_w=100;
pattern_l=pattern_w*1.33; //aspect ratio
pattern_thickness=1;

//xshift and yshift move the fingerprint about
xshift = 0;
yshift = 0;
//zoom, zooms...
zoom = 1;

//create the border
border();

//import the fingerprint dxf
*import_shape();
//subtract all the stuff we don't want
back();


module import_shape()
{
    translate([xshift,yshift,0])
        scale([zoom,zoom,0])
            translate([-pattern_w/2,-pattern_l/2,0])
                linear_extrude(height=pattern_thickness)
                   import("fingerprint.dxf") ;
}

module case_clipping()
{
    translate([0,0,pattern_thickness/2])
    difference()
    {
        cube([case_w*4,case_l*4,pattern_thickness*2],center=true);
        cube([case_w,case_l,pattern_thickness*4],center=true);
    }

}

module back()
{
    difference()
    {
        import_shape();
        case_clipping();
    }
}

module border()
{
    translate([0,0,case_h/2])
    difference()
    {
        cube([case_w+2*wall_thickness,case_l+2*wall_thickness,case_h],center=true);
        cube([case_w,case_l,case_h*2],center=true);
    }

}

