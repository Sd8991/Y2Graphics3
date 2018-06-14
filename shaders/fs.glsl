#version 330
 
// shader input
in vec2 P;
in vec2 uv;						// interpolated texture coordinates
in vec4 normal;					// interpolated normal
in vec4 worldPos;
//in GLint a;
uniform sampler2D pixels;		// texture sampler
//uniform vec4 ambientColor;		// ambient color

// shader output
out vec4 outputColor;
uniform vec3 lightPos;

// fragment shader
void main()
{
	vec3 L = lightPos - worldPos.xyz;
	vec3 R = reflect(L, normal.xyz);
	vec3 C = normalize(vec3(0,0,0) - worldPos.xyz);
	float dist = L.length(); 
	L = normalize( L ); 
	vec3 lightColor = vec3( 10, 10, 8 ); 
	vec3 materialColor = texture( pixels, uv ).xyz;
	vec3 specularLightColor = vec3( 10, 10, 8);
	vec3 specularMaterialColor = vec3(0.1f,0.1f,0.1f);
	vec4 ambientColor = vec4(0,0,0,0);
	float a = 0.5f;
	float attenuation = 1.0f / (dist * dist); 
	vec4 diffuse = vec4( materialColor * max( 0.0f, dot( L, normal.xyz ) ) * lightColor, 1 );
	vec4 specular = vec4( specularMaterialColor * max( 0.0f, pow(dot( C, R ), a)) * specularLightColor, 1);
	outputColor = ambientColor + attenuation * (diffuse + specular);
}