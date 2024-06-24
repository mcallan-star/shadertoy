

#iChannel0 "file://images/water.png"
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize the coordinates
    vec2 uv = fragCoord / iResolution.xy;
    
    // Create a time-dependent offset for the waves
    float offset = iTime * 0.1;
    
    // Calculate the displacement of the waves
    float displacement = sin(uv.x * 10.0 + offset) * 0.1 + sin(uv.y * 10.0 + offset) * 0.1;
    
    // Add some noise to the displacement
    float noise = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
    displacement += noise * 0.1;
    
    // Apply the displacement to the UV coordinates
    vec2 distortedUV = uv + vec2(displacement, displacement);
    
    // Sample the color from the distorted UV coordinates
    vec3 color = texture(iChannel0, distortedUV).rgb;
    
    // Output the final color
    fragColor = vec4(color, 1.0);
}

