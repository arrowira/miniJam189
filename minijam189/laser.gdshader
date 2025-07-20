shader_type canvas_item;

uniform vec4 color : source_color = vec4(1.0, 0.5, 0.0, 1.0); // Example: orange
uniform float fade_height : hint_range(0.01, 1.0) = 0.5;
uniform float speed : hint_range(0.0, 5.0) = 1.0;
uniform float time_offset = 0.0;

void fragment() {
    float t = mod(TIME * speed + time_offset, 3.0);
    float fade = clamp(1.0*(1.0 - UV.y - t * fade_height) / fade_height + 1.0, 0.0, 1.0);

    vec4 c = color;
    c.a *= fade;

    COLOR = c;
}
