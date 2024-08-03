// raymarched gyroid surface, glowing accumulation, rotating in z
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    vec3 rd = normalize(vec3(uv*1.6, -1.0));
    vec3 ro = vec3(0.0,0.0,-2.0);
    float a = iTime, t=0.0, acc=0.0;
    for(int i=0;i<48;i++){
        vec3 p = ro+rd*t;
        p.xz = mat2(cos(a),-sin(a),sin(a),cos(a))*p.xz;
        float s=3.0;
        float g = sin(p.x*s)*cos(p.y*s)+sin(p.y*s)*cos(p.z*s)+sin(p.z*s)*cos(p.x*s);
        acc += exp(-abs(g)*3.0)*0.06;
        t += max(abs(g)*0.18+0.01, 0.02);
    }
    vec3 col = (vec3(0.2,0.2,0.3)+vec3(0.5)*cos(6.28318*(acc*1.5+vec3(0.2,0.4,0.6))))*clamp(acc*2.0,0.0,1.0);
    fragColor = vec4(col,1.0);
}
