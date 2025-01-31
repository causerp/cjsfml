package cjsfml.graphics

import cjsfml.system.*

@C
public struct Vertex {
    public const Vertex(
        public var position!: Vector2f = Vector2f(),
        public var color!: Color = Color.White,
        public var texCoords!: Vector2f = Vector2f()
    ) {}
}
