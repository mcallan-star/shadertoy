// plasma - classic sine-sum plasma with an IQ cosine palette
vec3 palette(float t){
    return vec3(0.5) + vec3(0.5)*cos(6.28318*(vec3(1.0)*t + vec3(0.0,0.33,0.67)));
}
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    float t = iTime;
    vec2 p = uv*6.0;
    float v = sin(p.x+t) + sin(p.y+t) + sin(p.x+p.y+t) + sin(length(p)*1.5 - 2.0*t);
    fragColor = vec4(palette(v*0.15), 1.0);
}
