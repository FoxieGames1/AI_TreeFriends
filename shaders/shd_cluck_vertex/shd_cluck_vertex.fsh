// not sure why gm_AlphaRefValue does not work so we have to do this ourselves
uniform float alphaRef;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fogStrength;
uniform float fogStart;
uniform float fogEnd;
uniform vec3 fogColor;

varying vec3 v_FogCameraRelativePosition;

void CommonFog(inout vec4 baseColor);

void CommonFog(inout vec4 baseColor) {
    float dist = length(v_FogCameraRelativePosition);
    float f = clamp((dist - fogStart) / (fogEnd - fogStart), 0.0, 1.0);
    baseColor.rgb = mix(baseColor.rgb, fogColor, f * fogStrength);
}

void main() {
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    CommonFog(gl_FragColor);
    if (gl_FragColor.a < alphaRef) discard;
}