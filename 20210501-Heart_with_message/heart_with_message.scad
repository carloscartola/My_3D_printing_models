//import("Heart_font_awesome.svg");

//translate ([-165,-250,0]) linear_extrude(height = 20, scale = .5) scale([.5, .5, .5]) import("Heart_font_awesome.svg"); 

// CONFIGURATION
// Set parameters

// Square size set all other sizes, so just scale the model, somehow useless as it can be done on slicer
square_size = 100;
// For different letter size
relative_letter_size = 4.4;
// First name
name1 = "Dudu";
// Second name
name2 = "Soso";

// Calculated parameters
circle_radius = square_size / 2;
transl = square_size * 0.75;
string = str(name1, " \u2665 ", name2);
letter_height = square_size / 12;
final_letter_size = (square_size * relative_letter_size) / 40;
font = "Segoe Print:style=Bold";

// Functions

module flat_heart_centered() {
    
    translate([-transl,-transl,0])
      square(square_size);

  translate([-transl+circle_radius, transl-circle_radius, 0])
    circle(circle_radius, $fn=180);

  translate([transl-circle_radius, -transl+circle_radius, 0])
    circle(circle_radius, $fn=180);
}

// Main program

difference() {
    
    translate([0,0,.1])
        scale([1.35,1.35,0.95])
        linear_extrude(height = circle_radius/1.8) flat_heart_centered();

    scale([.9,.9,1]) // a partir daqui levar pra difference
        linear_extrude(height = circle_radius/1.8, scale = 1.4) flat_heart_centered();

    translate([-transl+(square_size/1.8),-transl-(circle_radius/3.6),final_letter_size*sqrt(2)/2])
        rotate([-45,0,0])
        linear_extrude(height = letter_height*1.5) {
           text(string, size = final_letter_size, font = font, halign = "center", valign = "center", $fn = 16);
        }

}

