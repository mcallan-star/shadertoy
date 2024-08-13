# raymarching signed distance fields (SDF)

how `shaders/raymarch_sphere.glsl` and `shaders/gyroid.glsl` actually work.

## the idea
instead of triangles, you define a shape by a function that returns the distance to the nearest surface (the SDF). then you march a ray forward in steps equal to that distance until you basically hit something (distance close to 0). its called sphere tracing.

```glsl
float map(vec3 p) { return length(p) - 1.0; }   // SDF of a unit sphere

float raymarch(vec3 ro, vec3 rd) {
    float t = 0.0;
    for (int i = 0; i < 80; i++) {
        float d = map(ro + rd*t);
        if (d < 0.001) break;       // hit the surface
        t += d;                     // its safe to jump this far, nothing is closer
    }
    return t;
}
```

## normals (for lighting)
estimate the gradient of the SDF with small offsets in x, y, z (central differences). this is the exact same numerical-derivative trick i use in my python sims, just in 3d.

## shading
once you have the hit point and the normal, do phong: ambient + diffuse * max(0, dot(N, L)) + specular. that is literally the optics of light bouncing off a surface (a diffuse term plus a shiny highlight).

## the gyroid
`sin(p.x)*cos(p.y) + sin(p.y)*cos(p.z) + sin(p.z)*cos(p.x) = 0` is a real triply-periodic minimal surface. it actually shows up in butterfly wings and block-copolymer materials. using it as the `map()` gives that endless lattice.

ref: https://iquilezles.org/articles/distfunctions/
