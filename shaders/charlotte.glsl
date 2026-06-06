// charlotte!! my cheeto cat. iChannel0 = images/charlotte.jpg
// pinch the center of her face (~80% radius, pulsing) and wiggle the whole thing
// around disney-style - a little circle plus a left/right sway. the pinch center is
// nudged right ~10% so it sits on the middle of her face, and it follows the wiggle.
// the "i love charlotte" caption is baked onto the gif loop.

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec2 c = uv - 0.5;
    float t = iTime;

    // wiggle the whole image: circle + left/right sway + a tiny tilt
    c -= vec2(0.05 * sin(t) + 0.03 * sin(2.0 * t), 0.05 * (cos(t) - 1.0));
    float a = 0.05 * sin(2.0 * t);
    c = mat2(cos(a), -sin(a), sin(a), cos(a)) * c;

    // pinch her face: center nudged right 10%, 80% gradient radius, pulsing inward twice
    vec2 pc = c - vec2(0.10, 0.0);
    float r = length(pc);
    float w = smoothstep(0.80, 0.0, r);
    float amt = 0.40 * (0.5 - 0.5 * cos(2.0 * t));
    c = vec2(0.10, 0.0) + pc * (1.0 + amt * w);

    vec3 cat = texture(iChannel0, c + 0.5).rgb;
    float v = smoothstep(1.2, 0.3, length(uv - 0.5));   // vignette so she pops
    fragColor = vec4(cat * v, 1.0);
}
