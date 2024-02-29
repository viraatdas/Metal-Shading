#include <metal_stdlib>
using namespace metal;

// Vertex data structure
struct Vertex {
    float4 position [[position]];
    float4 color;
};

// Vertex function
vertex Vertex simpleVertexShader(constant Vertex *vertices [[buffer(0)]], uint vid [[vertex_id]]) {
    return vertices[vid];
}

// Fragment function
fragment float4 simpleFragmentShader(Vertex v [[stage_in]]) {
    return v.color;
}

