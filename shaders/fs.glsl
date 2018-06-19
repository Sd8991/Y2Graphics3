#version 330
 
// shader input
in vec2 uv;						// interpolated texture coordinates
in vec4 normal;					// interpolated normal
in vec4 worldPos;

uniform sampler2D pixels;		// texture sampler
uniform vec3 lightPos;
uniform vec3 lightCol;
uniform vec4 ambientColor;		// ambient color

// shader output
out vec4 outputColor;

// fragment shader
void main()
{
	vec3 L = lightPos - worldPos.xyz;
	vec3 R = normalize(reflect(L, normal.xyz));
	vec3 C = normalize(worldPos.xyz);
	float dist = L.length(); 
	L = normalize( L ); 
	vec3 materialColor = texture( pixels, uv ).xyz;
	vec3 specularLightColor = lightCol;
	vec3 specularMaterialColor = materialColor;
	float attenuation = 1.0f / (dist * dist); 
	vec4 diffuse = vec4( materialColor * max( 0.0f, dot( L, normal.xyz ) ) * lightCol, 1 );
	vec4 specular = vec4( specularMaterialColor * max( 0.0f, pow(dot( C, R ), 0.5f)) * specularLightColor, 1);
	outputColor = ambientColor + attenuation * (diffuse + specular);
	outputColor = outputColor * 255;
}