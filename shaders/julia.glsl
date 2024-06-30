// julia set - the constant c orbits a circle, so the animation loops
vec3 palette(float t){
    return vec3(0.5) + vec3(0.5)*cos(6.28318*(vec3(1.0)*t + vec3(0.0,0.1,0.2)));
}
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    float a = iTime;
    vec2 c = 0.7885*vec2(cos(a), sin(a));
    vec2 z = uv*3.0;
    const int N = 96;
    int it = 0;
    for(int i=0;i<N;i++){
        z = vec2(z.x*z.x - z.y*z.y, 2.0*z.x*z.y) + c;
        if(dot(z,z) > 4.0) break;
        it++;
    }
    float n = float(it)/float(N);
    vec3 col = (it>=N) ? vec3(0.0) : palette(n+0.4);
    fragColor = vec4(col, 1.0);
}
