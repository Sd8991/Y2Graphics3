#version 330
 
// shader input
in vec2 vUV;				// vertex uv coordinate
in vec3 vNormal;			// untransformed vertex normal
in vec3 vPosition;			// untransformed vertex position

// shader output
out vec4 normal;			// transformed vertex normal
out vec2 uv;	
out vec2 P;			
uniform mat4 transform;
uniform mat4 toWorld;
 
// vertex shader
void main()
{
	// transform vertex using supplied matrix
	gl_Position = transform * vec4(vPosition, 1.0f);

	worldPos = toWorld * vec4(vPosition, 1.0f);

	// forward normal and uv coordinate; will be interpolated over triangle
	normal = transform * vec4( vNormal, 0.0f );
	P = vec2( vPosition ) + 0.5 + vec2( 0.5, 0.5 );
	uv = vUV;
}