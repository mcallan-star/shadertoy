# noise + domain warping

for `shaders/domain_warp.glsl` and the cloudy/flowy looks.

## value noise
hash the integer grid corners to pseudo-random values, then smoothstep-interpolate between them. one octave looks soft and blobby.

## fbm (fractal brownian motion)
stack octaves of noise at doubling frequency and halving amplitude:

```glsl
float f = 0.0, amp = 0.5;
for (int i = 0; i < 6; i++) { f += amp*noise(p); p *= 2.0; amp *= 0.5; }
```

its self-similar across scales, which is exactly why it reads as clouds / terrain / turbulence. same fractal idea as the mandelbrot set, just used for texture.

## domain warping
feed fbm into the COORDINATES of more fbm:

```glsl
fbm(p + fbm(p + fbm(p)))
```

the field drags itself around and you get those organic flowy shapes. cheap and looks expensive.

ref: https://iquilezles.org/articles/warp/
