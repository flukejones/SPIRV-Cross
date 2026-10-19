#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct BlockIO
{
    float v;
    float4 components;
};

struct main0_out
{
    float outBlock_v;
    float4 outBlock_components;
};

kernel void main0(uint3 gl_GlobalInvocationID [[thread_position_in_grid]], uint3 spvStageInputSize [[grid_size]], uint3 spvDispatchBase [[grid_origin]], device main0_out* spvOut [[buffer(28)]])
{
    BlockIO outBlock = {};
    device main0_out& out = spvOut[gl_GlobalInvocationID.y * spvStageInputSize.x + gl_GlobalInvocationID.x];
    if (any(gl_GlobalInvocationID >= spvStageInputSize))
        return;
    uint gl_VertexIndex = gl_GlobalInvocationID.x + spvDispatchBase.x;
    outBlock.v = 1.0;
    outBlock.components.x = 2.0;
    outBlock.components.y = 3.0;
    outBlock.components.z = 4.0;
    outBlock.components.w = 5.0;
    outBlock.components[int(gl_VertexIndex) & 3] = float(int(gl_VertexIndex));
    out.outBlock_v = outBlock.v;
    out.outBlock_components = outBlock.components;
}

