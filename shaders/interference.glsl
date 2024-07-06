// three-source circular wave interference - intensity = |sum of waves|^2
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    float t = iTime;
    float k = 26.0, w = 2.0;
    vec2 s[3];
    s[0]=vec2(-0.35,0.0); s[1]=vec2(0.35,0.0); s[2]=vec2(0.0,0.42);
    float sum = 0.0;
    for(int i=0;i<3;i++) sum += cos(k*length(uv - s[i]) - w*t);
    float I = pow(sum/3.0, 2.0);
    vec3 base = vec3(0.05,0.1,0.2) + vec3(0.3,0.4,0.5)*cos(6.28318*(vec3(0.6,0.7,0.8)*(I*0.5+0.1)+vec3(0.1,0.2,0.4)));
    fragColor = vec4(base*(0.25 + 0.95*I), 1.0);
}
