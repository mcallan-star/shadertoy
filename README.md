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
three point sources, intensity = |sum waves|^2<br/>
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

## Older sketches
`sine.glsl`, `water-waves.glsl`, `rainbow-gradient.glsl`, `matrix.glsl`, `duck.glsl`

## Run
Paste any shader into <https://www.shadertoy.com/new>, or run locally with a GLSL viewer (glslViewer, VS Code shader extensions, etc.).
