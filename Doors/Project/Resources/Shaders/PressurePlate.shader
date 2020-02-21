shader_type canvas_item;

uniform vec4 origin:hint_color;
uniform vec4 new:hint_color;

void fragment() {
    vec4 current_pixel = texture(TEXTURE, UV);

    if (current_pixel == origin)
        COLOR = new;
    else
        COLOR = current_pixel;
}