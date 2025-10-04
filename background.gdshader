shader_type canvas_item;


	// Called for every vertex the material is visible on.

uniform vec4 tilecolor :source_color = vec4(1);
void fragment() {
    COLOR=tilecolor;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
