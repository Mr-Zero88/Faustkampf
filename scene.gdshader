shader_type canvas_item;

uniform sampler2D FRONT : filter_nearest , repeat_disable;
uniform sampler2D BACK : filter_nearest , repeat_disable;
uniform sampler2D VP : filter_nearest , repeat_disable;

uniform float rotation;
uniform float hoverZoom = 1.0;

uniform float width = 128;
uniform float height = 192;

uniform float lean = 0.1;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	vec2 WH = vec2(width, height);
	
	vec2 _UV = ((round((UV * 1.4) * WH - vec2(0.5)) / WH) - 0.2) * (1.0 - hoverZoom) + vec2(hoverZoom / 2.0); //UV = (round(UV * vec2(width,height)) / vec2(width,height))
	
	vec2 F_UV = vec2(
		clamp(((_UV.x - 0.5) / max(rotation,0.0) + 0.5) + pow(_UV.y, 2.0) * lean * (max(rotation,0.0) - 1.0),0.0,1.0),
		_UV.y + pow(_UV.x , 2.0) * lean * (rotation - 1.0)
	);
	
	vec2 B_UV = vec2(
		1.0 - clamp(((_UV.x - 0.5) / max(-rotation,0.0) + 0.5) - _UV.y * lean * (max(-rotation,0.0) - 1.0),0.0,1.0),
		_UV.y - pow(_UV.x , 2.0) * lean * (rotation + 1.0)
	);
	vec4 overlay = texture(VP,F_UV).rgba;
	
	vec4 bCol = texture(BACK, B_UV).rgba;
	vec4 fCol = texture(FRONT, F_UV).rgba;
	
	fCol.xyz *= 1.0 - overlay.a;
	fCol.xyz += overlay.xyz;


	COLOR.xyz = fCol.rgb * fCol.a;
	COLOR.xyz += bCol.rgb * bCol.a;
	COLOR.a = max(fCol.a, bCol.a);

	}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
