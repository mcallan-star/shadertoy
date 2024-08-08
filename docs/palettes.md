# cosine palettes (the iq trick)

the one-liner that makes basically everything look good:

```glsl
vec3 palette(float t) {
    vec3 a = vec3(0.5);              // base brightness
    vec3 b = vec3(0.5);              // contrast / amplitude
    vec3 c = vec3(1.0);              // frequency
    vec3 d = vec3(0.0, 0.33, 0.67); // phase offset per channel
    return a + b*cos(6.28318*(c*t + d));
}
```

- feed it `t` in 0..1 and you get a smooth, loopable band of color
- the per-channel phase `d` is the whole secret. equal phases give grayscale, offset phases give rainbow
- bump `c` for more color cycles, shift `d` to recolor the whole thing
- it never clips weird because cos stays in -1..1, so the output stays in 0..1

ref: inigo quilez, https://iquilezles.org/articles/palettes/

math note: this is just a fourier idea. one cosine per channel with its own phase is the first harmonic of a color signal. same reason a single sine already looks like a smooth wave in my python plots.
