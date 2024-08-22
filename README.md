# shadertoy

A little collection of GLSL fragment shaders I've messed around with - wave propagation, fractals, raymarching, and noise. Each `.glsl` is Shadertoy-ready (paste into the editor; uses `iTime` / `iResolution`). GIFs below are short loops captured from each one.

## Gallery

<table>
<tr>
<td align="center" width="33%">
  <img src="media/plasma.gif" width="240"/><br/>
  <b>Plasma</b><br/>
sine-sum field + IQ cosine palette<br/>
  <a href="shaders/plasma.glsl">code</a>
</td>
<td align="center" width="33%">
  <img src="media/julia.gif" width="240"/><br/>
  <b>Julia set</b><br/>
constant <code>c</code> orbits a circle, so it loops<br/>
  <a href="shaders/julia.glsl">code</a>
</td>
<td align="center" width="33%">
  <img src="media/interference.gif" width="240"/><br/>
  <b>Wave interference</b><br/>
three point sources, intensity = |sum of waves|^2<br/>
  <a href="shaders/interference.glsl">code</a>
</td>
</tr>
<tr>
<td align="center" width="33%">
  <img src="media/domain_warp.gif" width="240"/><br/>
  <b>Domain warp</b><br/>
fbm warped by fbm (Inigo Quilez style)<br/>
  <a href="shaders/domain_warp.glsl">code</a>
</td>
<td align="center" width="33%">
  <img src="media/raymarch_sphere.gif" width="240"/><br/>
  <b>Raymarched sphere</b><br/>
SDF sphere, diffuse + specular, orbiting light<br/>
  <a href="shaders/raymarch_sphere.glsl">code</a>
</td>
<td align="center" width="33%">
  <img src="media/truchet.gif" width="240"/><br/>
  <b>Truchet tiles</b><br/>
random arc orientation per cell, glowing<br/>
  <a href="shaders/truchet.glsl">code</a>
</td>
</tr>
<tr>
<td align="center" width="33%">
  <img src="media/starfield.gif" width="240"/><br/>
  <b>Warp starfield</b><br/>
layered depth, hash-placed stars<br/>
  <a href="shaders/starfield.glsl">code</a>
</td>
<td align="center" width="33%">
  <img src="media/gyroid.gif" width="240"/><br/>
  <b>Gyroid</b><br/>
raymarched implicit surface, glow accumulation<br/>
  <a href="shaders/gyroid.glsl">code</a>
</td>
<td align="center" width="33%"></td>
</tr>
</table>

## the physics and math hiding in here

honestly half of these are just my physics and math classes wearing a costume (°◡°♡). a couple of side-by-sides, the shader next to the actual sim:

**wave interference.** the interference shader is the same thing i simulated for my optics lab: a few point sources, brightness = the squared magnitude of the summed waves. shader on the left, the real diffraction sim (from my python-junk repo) on the right.

<table>
<tr>
<td align="center"><img src="media/interference.gif" width="260"/><br/>interference.glsl (GPU, real-time)</td>
<td align="center"><img src="https://github.com/mcallan-star/Python-junk/raw/main/media/double_slit.png" width="260"/><br/>the real double-slit sim (python-junk)</td>
</tr>
</table>

**fractals / complex dynamics.** the julia shader iterates z -> z^2 + c with c fixed. its cousin the mandelbrot set runs the same iteration but fixes the start and varies c. same escape-time idea, different knob.

<table>
<tr>
<td align="center"><img src="media/julia.gif" width="260"/><br/>julia.glsl</td>
<td align="center"><img src="https://github.com/mcallan-star/Python-junk/raw/main/media/mandelbrot.png" width="260"/><br/>mandelbrot (python-junk)</td>
</tr>
</table>

and the rest, quickly:

| shader | what it's secretly doing |
|--------|--------------------------|
| plasma | a sum of sine waves. superposition, same as stacking harmonics |
| domain_warp | fbm noise warped by more fbm. self-similar / fractal, like turbulence |
| raymarch_sphere | a signed distance field plus sphere tracing, then phong shading, which is just how light reflects off a surface (a diffuse term and a shiny highlight) |
| gyroid | a real triply-periodic minimal surface: sin x cos y + sin y cos z + sin z cos x = 0 |
| truchet | truchet tiling, basically a coin flip of orientation per tile |
| starfield | layered parallax with 1/z perspective depth |

## notes
shader cheatsheet and per-technique writeups, since i kept relearning this stuff:
- [`notes-to-self.md`](notes-to-self.md) - the shadertoy uniforms, the palette one-liner, gotchas
- [`docs/palettes.md`](docs/palettes.md) - the iq cosine palette
- [`docs/raymarching.md`](docs/raymarching.md) - SDF sphere tracing (sphere + gyroid)
- [`docs/noise.md`](docs/noise.md) - fbm + domain warping
- [`docs/capturing-loops.md`](docs/capturing-loops.md) - making a seamless gif loop

## Older sketches
`sine.glsl`, `water-waves.glsl`, `rainbow-gradient.glsl`, `matrix.glsl`, `duck.glsl`

## Run
Paste any shader into <https://www.shadertoy.com/new>, or run locally with a GLSL viewer (glslViewer, VS Code shader extensions, etc.).
