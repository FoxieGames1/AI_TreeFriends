/*////////////////////////////////////////////////////////////////////////
	SMF static fragment shader
	This is the standard shader that comes with the SMF system.
	This does some basic diffuse, specular and rim lighting.
*/////////////////////////////////////////////////////////////////////////
varying vec2 v_vTexcoord;
varying vec3 v_eyeVec;
varying vec3 v_vNormal;
varying float v_vRim;

uniform float R;
uniform float G;
uniform float B;
uniform float A;

void main()
{
    gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
	
	//Color and Alpha
	gl_FragColor.rgb *= vec3(R,G,B);
	gl_FragColor.a = A;
}