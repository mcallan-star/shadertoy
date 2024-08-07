# notes to self (shaders)

a cheatsheet for myself. i come back to shadertoy every few months and forget half of this.

## the shadertoy uniforms
- `iResolution` - viewport size in pixels (xy). `uv = fragCoord/iResolution.xy` gives 0..1
- `iTime` - seconds since start. animate everything off this
- `iMouse` - mouse: xy = position, zw = last click
- `iChannel0..3` - input textures or other buffers. read with `texture(iChannel0, uv)`
- entry point is `void mainImage(out vec4 fragColor, in vec2 fragCoord)`

## centering + aspect ratio
- `vec2 p = (fragCoord - 0.5*iResolution.xy) / iResolution.y;` puts the origin in the middle and divides by y so circles stay round on a wide screen

## the iq cosine palette (i use this constantly)
- `vec3 col = a + b*cos(6.28318*(c*t + d));` gives smooth gradients
- a = brightness, b = contrast, c = frequency, d = per-channel phase
- the per-channel phase is what makes it rainbow instead of gray. see docs/palettes.md

## gotchas
- glsl has no print. debug by dumping a value straight into a color:
`fragColor = vec4(vec3(x), 1.0);`
- your whole toolbox is `mod fract step smoothstep mix clamp length dot`
- 6.28318 is 2*pi. i just hardcode it
- branches are slow on the GPU, prefer `step`/`mix` over `if` when you can
- everything runs per-pixel in parallel. there's no loop over the image, the image IS the loop. (this took me a while to really get.)

## making the gif loop
the whole trick is getting `iTime` to repeat cleanly. see docs/capturing-loops.md.

## the techniques, broken out
- docs/palettes.md - color
- docs/raymarching.md - the 3d ones (sphere, gyroid)
- docs/noise.md - fbm + domain warping
- docs/capturing-loops.md - seamless gifs
