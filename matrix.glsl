void main() {
    // Get the coordinates of the current pixel
    vec2 uv = gl_FragCoord.xy / iResolution.xy;

    // Calculate the distance from the center of the screen
    float distance = length(uv - 0.5);

    // Calculate the angle based on the distance
    float angle = atan(uv.y - 0.5, uv.x - 0.5);

    // Calculate the color based on the angle and distance
    vec3 color = vec3(0.0);
    if (distance < 0.5) {
        // Apply matrix-style transformation
        float scale = 1.0 - distance * 2.0;
        float rotation = angle + iTime;
        vec2 transformedUV = vec2(cos(rotation), sin(rotation)) * scale;
        color = vec3(transformedUV, 1.0);
    }

    // Set the color of the pixel
    gl_FragColor = vec4(color, 1.0);
}
// Shader code for a simple matrix-style transformation effect





