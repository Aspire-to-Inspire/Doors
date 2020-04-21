shader_type canvas_item;
uniform vec3 color = vec3(.3, .6, .9);
uniform int OCTAVES = 4;
uniform vec2 center = vec2(0.5, 0.8);

float circleshape(vec2 position, float radius)
{
	return step(radius,length(position));
}

float rand(vec2 coord){
    return fract(sin(dot(coord,vec2(58, 78)) * 100.0) * 10.0);
}


float noise(vec2 coord){
    vec2 i = floor(coord);
    vec2 f = fract(coord);
    float a = rand(i); //left top corner
    float b = rand(i + vec2(1.0,0.0));
    float c = rand(i + vec2(0.0,1.0));
    float d = rand(i + vec2(1.0,1.0));
    
    vec2 cubic = f * f * (3.0 - 2.0 * f);
    
    return mix(a, b, cubic.x) + (c - a) * cubic.y * (1.0 - cubic.x) + (d - b) * cubic.x * cubic.y;
}

float fbm(vec2 coord){
    float value = 0.0;
    float scale = 0.5;
    for (int i = 0; i < OCTAVES; ++i){
        value += noise(coord) * scale;
        coord *= 2.0;
        scale *= scale;
    }
    return value;
}
float circle_shape(vec2 coord, float radius)
{
	return step(radius, length(coord));
}

float egg_shape(vec2 coord, float radius){
	vec2 diff = abs(coord - center);
	
	if(coord.y < center.y){
		diff.y /= 2.0;
	} else {
		diff.y *= 2.0;
	}
	
	float dist = sqrt(diff.x * diff.x + diff.y * diff.y) / radius;
	float value = sqrt(1.0 - dist * dist);
	return clamp(value,0.0,1.0);
}

void fragment(){
    vec2 coord = UV * 10.0;
    float circle = circle_shape(coord, 0.3);
	
    vec2 motion = vec2( fbm(coord + vec2(TIME * 3.0 ,TIME * 5.0)) );
    float final = fbm(coord + motion);
    COLOR = vec4(color, final);
	
}