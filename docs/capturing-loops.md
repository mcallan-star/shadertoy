# capturing a seamless gif loop

how i get the gifs in `media/` to loop without a visible jump.

## make iTime periodic
the whole trick: every time-dependent term has to complete a WHOLE number of cycles over the loop length L. so animate with `iTime * 6.28318 * k / L` using an integer k, or just pick a period and grab exactly one of it.

- if a wave runs at a non-integer multiple of the loop, the last frame won't match the first and youll see a pop. (i learned this the hard, annoying way.)

## grabbing the frames
- shadertoy has a built-in recorder, or screen-capture a fixed-size window
- trim to exactly one period, then export to gif (gimp, ffmpeg, or pillow all work)
- keep it small: short period, modest resolution, limited palette (64ish colors)

## checking the seam
diff the last frame against the first. if that difference is way bigger than a normal frame-to-frame difference, the loop isn't closing and you need to fix the timing.
