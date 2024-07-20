// truchet tiles - random quarter-arc orientation per cell, glowing + pulsing
float hash(vec2 p){ return fract(sin(dot(p,vec2(127.1,311.7)))*43758.5453); }
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    vec2 g = uv*5.0 + vec2(iTime/6.2831,0.0); // scroll a full cell over a loop
    vec2 id = floor(g), f = fract(g);
    if(hash(id) > 0.5) f.x = 1.0 - f.x;
    float d = min(abs(length(f)-0.5), abs(length(f-1.0)-0.5));
    float glow = smoothstep(0.10,0.0,d)*(0.6+0.4*sin(iTime+id.x*0.5));
    vec3 col = vec3(0.2,0.1,0.3)+vec3(0.6,0.5,0.7)*cos(6.28318*(glow*0.8+0.2+vec3(0.1,0.3,0.6)));
    fragColor = vec4(col*glow, 1.0);
}
