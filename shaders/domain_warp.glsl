// domain-warped fbm (Inigo Quilez style); warp offset orbits a circle to loop
float hash(vec2 p){ return fract(sin(dot(p,vec2(127.1,311.7)))*43758.5453); }
float noise(vec2 p){
    vec2 i=floor(p), f=fract(p); vec2 u=f*f*(3.0-2.0*f);
    return mix(mix(hash(i),hash(i+vec2(1,0)),u.x),
               mix(hash(i+vec2(0,1)),hash(i+vec2(1,1)),u.x),u.y);
}
float fbm(vec2 p){ float v=0.0,a=0.5; for(int i=0;i<5;i++){v+=a*noise(p);p*=2.0;a*=0.5;} return v; }
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = (fragCoord - 0.5*iResolution.xy)/iResolution.y;
    vec2 p = uv*3.0 + vec2(5.0,3.0);
    vec2 o = 0.6*vec2(cos(iTime), sin(iTime));
    vec2 q = vec2(fbm(p+o), fbm(p+vec2(5.2,1.3)+o.yx));
    float r = fbm(p + 4.0*q);
    vec3 col = vec3(0.5)+vec3(0.5)*cos(6.28318*(vec3(1.0,1.0,0.5)*r+vec3(0.8,0.9,0.3)));
    fragColor = vec4(col*(0.3+0.9*r), 1.0);
}
