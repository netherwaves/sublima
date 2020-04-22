#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

// palette
vec3 c1 = vec3(0.89,  0.698, 0.192);
vec3 c2 = vec3(0.894, 0.486, 0.192);
vec3 c3 = vec3(0.788, 0.129, 0.29);
vec3 c4 = vec3(0.271, 0.6,   0.647);

// uniforms
uniform vec2 center, displace;
uniform float intensity, maxintensity, radius, ratio;

// varyings
varying vec4 vertColor;
varying vec4 vertTexCoord;

// main code
void main() {
    vec2 uv = vertTexCoord.xy;
    uv.x *= ratio;
    uv.x -= (ratio/4);
    uv += displace*0.5;
    float dist = distance(center, uv);

    vec4 outColor = vec4(mix(
        mix(c1, c2, displace.x + 1. / 2.),
        mix(c3, c4, displace.y + 1. / 2.), dist),
        (1.0 - (dist*0.6)) * (intensity/maxintensity) * 0.75
    );

    gl_FragColor = outColor;
}