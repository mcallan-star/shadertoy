#iChannel0 "https://66.media.tumblr.com/794310c731388a90bb0d9222067231b0/tumblr_inline_p7gdyyyQMM1somkem_540.jpg"
void main() {
    vec2 uv1 = gl_FragCoord.xy / iResolution.xy;

    uv1.x += 0.05 * sin(iTime + uv1.x * 10.0);
    uv1.y += 0.05 * sin(iTime + uv1.y * 10.0);

    vec4 color = texture(iChannel0, uv1);
    color.rgb *= color.rgb;

    vec2 uv2 = uv1;

    uv2.x += 0.05 * sin(iTime + uv2.x * 20.0);
    uv2.y += 0.05 * sin(iTime + uv2.y * 20.0);

    vec4 water = texture(iChannel1, uv2);
    // multiply
    color.r *= water.r;

    gl_FragColor = color;
}
