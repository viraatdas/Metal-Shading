import MetalKit

struct Vertex {
    var position: SIMD4<Float>
    var color: SIMD4<Float>
}

class MetalRenderer: NSObject {
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    var vertexBuffer: MTLBuffer?
    
    let triangleVertices: [Vertex] = [
        Vertex(position: [0.0, 1.0, 0.0, 1.0], color: [1.0, 0.0, 0.0, 1.0]), // Top vertex, Red
        Vertex(position: [-1.0, -1.0, 0.0, 1.0], color: [0.0, 1.0, 0.0, 1.0]), // Bottom left, Green
        Vertex(position: [1.0, -1.0, 0.0, 1.0], color: [0.0, 0.0, 1.0, 1.0])  // Bottom right, Blue
    ]
    
    init(device: MTLDevice) {
        self.device = device
        super.init()
        self.commandQueue = device.makeCommandQueue()
        self.vertexBuffer = device.makeBuffer(bytes: triangleVertices,
                                              length: triangleVertices.count * MemoryLayout<Vertex>.stride,
                                              options: .storageModeShared)
    }
}

extension MetalRenderer: MTKViewDelegate {
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor,
              let commandBuffer = commandQueue.makeCommandBuffer(),
              let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
            return
        }
        
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // Set other render states and draw calls here
        
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // Handle size changes if necessary
    }
}

