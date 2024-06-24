void main() {
    // Get the coordinates of the current pixel
    vec2 uv = gl_FragCoord.xy / iResolution.xy;

    // Calculate the y-coordinate of the sine wave
    float y = sin(uv.x * 10.0 + iTime);  

    // Set the color of the pixel based on the y-coordinate
    gl_FragColor = vec4(vec3(y), 1.0);  
}

// The shader code above creates a simple sine wave that varies in the y-direction. The sine wave is created by calculating the sine of the x-coordinate of the pixel and setting the color of the pixel based on the y-coordinate of the sine wave.




