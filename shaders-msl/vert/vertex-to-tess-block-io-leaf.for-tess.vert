#version 450

layout(location = 5) out BlockIO
{
	float v;
	vec4 components;
} outBlock;

void func()
{
	outBlock.v = 1.0;
	outBlock.components.x = 2.0;
	outBlock.components.y = 3.0;
	outBlock.components.z = 4.0;
	outBlock.components.w = 5.0;
	outBlock.components[gl_VertexIndex & 3] = float(gl_VertexIndex);
}

void main(void)
{
	func();
}
