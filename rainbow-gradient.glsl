void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Calculate the normalized x-coordinate
    float x = fragCoord.x / iMouse.x;
    
    // Calculate the RGB values for the rainbow
    vec3 rainbowColor = vec3(
        smoothstep(0.0, 1.0, x),
        smoothstep(0.0, 1.0, x - 0.33),
        smoothstep(0.0, 1.0, x - 0.67)
    );
    
    // Set the fragment color to the rainbow color
    fragColor = vec4(rainbowColor, 1.0);

}
// The shader code above creates a rainbow gradient effect by calculating the RGB values based on the x-coordinate of the pixel. The RGB values are then used to set the color of the pixel, resulting in a rainbow gradient effect.