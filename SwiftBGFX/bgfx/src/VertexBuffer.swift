// Copyright 2016 Stuart Carnie.
// License: https://github.com/stuartcarnie/SwiftBGFX#license-bsd-2-clause
//

/// Represents a static vertex buffer.
public class VertexBuffer {
    let handle: bgfx_vertex_buffer_handle_t
    
    /// Initializes a new instance of the `VertexBuffer`
    ///
    /// - parameter memory: The vertex data with which to populate the buffer
    /// - parameter layout: The layout of the vertex data
    /// - parameter flags:  Flags used to control buffer behavior
    public init(memory: MemoryBlock, layout: VertexLayout, flags: BufferFlags = [.none]) {
        handle = bgfx_create_vertex_buffer(memory.handle, &layout.handle, flags.rawValue)
    }
    
    deinit {
        bgfx_destroy_vertex_buffer(handle)
    }
}
