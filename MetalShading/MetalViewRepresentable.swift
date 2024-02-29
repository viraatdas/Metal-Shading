import SwiftUI
import MetalKit

struct MetalViewRepresentable: NSViewRepresentable {
    
    func makeNSView(context: Context) -> MTKView {
        let mtkView = MTKView()
        mtkView.device = MTLCreateSystemDefaultDevice()
        
        let renderer = MetalRenderer(device: mtkView.device!)
        context.coordinator.renderer = renderer // Store renderer in coordinator
        mtkView.delegate = renderer
        
        return mtkView
    }
    
    func updateNSView(_ nsView: MTKView, context: Context) {
        // TODO
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: MetalViewRepresentable
        var renderer: MetalRenderer?
        
        init(_ parent: MetalViewRepresentable) {
            self.parent = parent
        }
    }
}
