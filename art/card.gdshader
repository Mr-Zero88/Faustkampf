shader_type canvas_item;

uniform sampler2D TEX;
uniform sampler2D FRONT;
uniform sampler2D BACK;
uniform sampler2D VP;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	  COLOR = texture(TEX, COLOR.xy  * COLOR.a).ggga;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
