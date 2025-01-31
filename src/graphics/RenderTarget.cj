package cjsfml.graphics

import cjsfml.system.*

public interface RenderTarget <: ResourceHandle {
    func clear(): Unit {
        clear(Color.Black)
    }

    func clear(color: Color): Unit

    mut prop view: View

    prop defaultView: View

    func getViewport(view: View): IntRect

    func mapPixelToCoords(point: Vector2i): Vector2f {
        mapPixelToCoords(point, view)
    }

    func mapPixelToCoords(point: Vector2i, view: View): Vector2f

    func mapCoordsToPixel(point: Vector2f): Vector2i {
        mapCoordsToPixel(point, view)
    }

    func mapCoordsToPixel(point: Vector2f, view: View): Vector2i

    func drawRenderTarget(drawable: RenderTargetDrawable, states: RenderStates): Unit

    func draw(drawable: Drawable): Unit {
        draw(drawable, RenderStates.Default)
    }

    func draw(drawable: Drawable, states: RenderStates): Unit

    func draw(vertices: Array<Vertex>, primitiveType: PrimitiveType): Unit {
        draw(vertices, primitiveType, RenderStates.Default)
    }

    func draw(vertices: Array<Vertex>, primitiveType: PrimitiveType, states: RenderStates): Unit

    func draw(vertexBuffer: VertexBuffer): Unit {
        draw(vertexBuffer, RenderStates.Default)
    }

    func draw(vertexBuffer: VertexBuffer, states: RenderStates): Unit

    func draw(vertexBuffer: VertexBuffer, firstVertex: Int64, vertexCount: Int64): Unit {
        draw(vertexBuffer, firstVertex, vertexCount, RenderStates.Default)
    }

    func draw(vertexBuffer: VertexBuffer, firstVertex: Int64, vertexCount: Int64, states: RenderStates): Unit

    prop size: Vector2u

    prop isSrgb: Bool

    func setActive(): Unit {
        setActive(true)
    }

    func setActive(active: Bool): Bool

    func pushGLStates(): Unit

    func popGLStates(): Unit

    func resetGLStates(): Unit
}
