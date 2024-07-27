// layered warp-speed starfield; each layer's depth loops 0..1
float hash(vec2 p){ return fract(sin(dot(p,vec2(127.1,311.7)))*43758.5453); }
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    float rad = length(uv), ang = atan(uv.y,uv.x);
    vec3 col = vec3(0.0);
    for(int L=0;L<5;L++){
        float z = fract(iTime*0.15 + float(L)*0.2);
        float r = 0.02 + (1.0-z)*0.9;
        float cells = floor(ang/6.28318*60.0) + float(L)*13.0;
        float h = hash(vec2(cells, floor(r*40.0)));
        float star = smoothstep(0.02,0.0,abs(rad-r))*step(0.86,h);
        col += star*z*1.5*vec3(0.7,0.8,1.0);
    }
    fragColor = vec4(col,1.0);
}
