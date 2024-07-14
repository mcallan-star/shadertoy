// raymarched unit sphere with diffuse + specular, light orbits the sphere
float sdf(vec3 p){ return length(p) - 1.0; }
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    vec3 ro = vec3(0.0,0.0,3.0);
    vec3 rd = normalize(vec3(uv*1.4, -1.5));
    float t=0.0; bool hit=false; vec3 p;
    for(int i=0;i<64;i++){ p=ro+rd*t; float d=sdf(p); if(d<0.002){hit=true;break;} t+=d; if(t>10.0)break; }
    vec3 col = vec3(0.0);
    if(hit){
        vec3 n = normalize(p);
        float a = iTime;
        vec3 L = normalize(vec3(0.6*cos(a)-0.5*sin(a), 0.6, 0.6*sin(a)+0.5*cos(a)));
        float diff = clamp(dot(n,L),0.0,1.0);
        float spec = pow(diff,32.0);
        vec3 base = vec3(0.5,0.4,0.6)+vec3(0.5,0.4,0.4)*cos(6.28318*(0.5+0.5*n.x+vec3(0.0,0.2,0.5)));
        col = base*(0.15+diff) + spec*0.8;
    }
    fragColor = vec4(col, 1.0);
}
