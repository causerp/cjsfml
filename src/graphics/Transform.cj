package cjsfml.graphics

import cjsfml.system.*

foreign {
    func sfTransform_getMatrix(transform: CPointer<Transform>, matrix: CPointer<Float32>): Unit

    func sfTransform_getInverse(transform: CPointer<Transform>): Transform

    func sfTransform_transformPoint(transform: CPointer<Transform>, point: Vector2f): Vector2f

    func sfTransform_transformRect(transform: CPointer<Transform>, rect: FloatRect): FloatRect

    func sfTransform_combine(transform: CPointer<Transform>, other: CPointer<Transform>): Unit

    func sfTransform_translate(transform: CPointer<Transform>, x: Float32, y: Float32): Unit

    func sfTransform_rotate(transform: CPointer<Transform>, angle: Float32): Unit

    func sfTransform_rotateWithCenter(transform: CPointer<Transform>, angle: Float32, centerX: Float32, centerY: Float32): Unit

    func sfTransform_scale(transform: CPointer<Transform>, scaleX: Float32, scaleY: Float32): Unit

    func sfTransform_scaleWithCenter(transform: CPointer<Transform>, scaleX: Float32, scaleY: Float32, centerX: Float32,
        centerY: Float32): Unit
}

@C
public struct Transform {
    public var matrix: VArray<Float32, $9> = VArray<Float32, $9>(repeat: 0.0)

    public init() {
        matrix[0] = 1.0
        matrix[4] = 1.0
        matrix[8] = 1.0
    }

    public init(a00: Float32, a01: Float32, a02: Float32, a10: Float32, a11: Float32, a12: Float32, a20: Float32,
        a21: Float32, a22: Float32) {
        matrix[0] = a00
        matrix[1] = a01
        matrix[2] = a02
        matrix[3] = a10
        matrix[4] = a11
        matrix[5] = a12
        matrix[6] = a20
        matrix[7] = a21
        matrix[8] = a22
    }

    public operator func ==(right: Transform): Bool {
        (matrix[0] == right.matrix[0] && matrix[1] == right.matrix[1] && matrix[2] == right.matrix[2] && matrix[3] == right
            .matrix[3] && matrix[4] == right.matrix[4] && matrix[5] == right.matrix[5] && matrix[6] == right.matrix[6] &&
            matrix[7] == right.matrix[7] && matrix[8] == right.matrix[8])
    }

    public operator func !=(right: Transform): Bool {
        (matrix[0] != right.matrix[0] || matrix[1] != right.matrix[1] || matrix[2] != right.matrix[2] || matrix[3] != right
            .matrix[3] || matrix[4] != right.matrix[4] || matrix[5] != right.matrix[5] || matrix[6] != right.matrix[6] ||
            matrix[7] != right.matrix[7] || matrix[8] != right.matrix[8])
    }

    public operator func [](index: Int64): Float32 {
        matrix[index]
    }

    public operator func [](x: Int64, y: Int64): Float32 {
        matrix[x * 3 + y]
    }

    // these 2 functions cause a compiler error in Cangjie 1.0.0

    public operator func [](index: Int64, value!: Float32): Unit {
        // matrix[index] = value
    }

    public operator func [](x: Int64, y: Int64, value!: Float32): Unit {
        // matrix[x * 3 + y] = value
    }

    public static let identity = Transform()

    public func getMatrix(): Array<Float32> {
        var matrix = Array<Float32>(16, repeat: 0.0)
        var transform2 = this
        unsafe {
            let rawData = acquireArrayRawData(matrix)
            try {
                sfTransform_getMatrix(inout transform2, rawData.pointer)
            } finally {
                releaseArrayRawData(rawData)
            }
        }
        return matrix
    }

    public func getInverse(): Transform {
        unsafe {
            var transform2 = this
            return sfTransform_getInverse(inout transform2)
        }
    }

    public func transform(point: Vector2f): Vector2f {
        unsafe {
            var transform2 = this
            return sfTransform_transformPoint(inout transform2, point)
        }
    }

    public func transform(x: Float32, y: Float32): Vector2f {
        transform(Vector2f(x, y))
    }

    public func transform(rect: FloatRect): FloatRect {
        unsafe {
            var transform2 = this
            return sfTransform_transformRect(inout transform2, rect)
        }
    }

    public func combine(other: Transform): Transform {
        unsafe {
            var transform2 = this
            var other2 = other
            sfTransform_combine(inout transform2, inout other2)
            return transform2
        }
    }

    public func translate(offset: Vector2f): Transform {
        translate(offset.x, offset.y)
    }

    public func translate(x: Float32, y: Float32): Transform {
        unsafe {
            var transform2 = this
            sfTransform_translate(inout transform2, x, y)
            return transform2
        }
    }

    public func rotate(angle: Float32): Transform {
        unsafe {
            var transform2 = this
            sfTransform_rotate(inout transform2, angle)
            return transform2
        }
    }

    public func rotate(angle: Float32, center: Vector2f): Transform {
        rotate(angle, center.x, center.y)
    }

    public func rotate(angle: Float32, centerX: Float32, centerY: Float32): Transform {
        unsafe {
            var transform2 = this
            sfTransform_rotateWithCenter(inout transform2, angle, centerX, centerY)
            return transform2
        }
    }

    public func scale(factors: Vector2f): Transform {
        scale(factors.x, factors.y)
    }

    public func scale(scaleX: Float32, scaleY: Float32): Transform {
        unsafe {
            var transform2 = this
            sfTransform_scale(inout transform2, scaleX, scaleY)
            return transform2
        }
    }

    public func scale(factors: Vector2f, center: Vector2f): Transform {
        scale(factors.x, factors.y, center.x, center.y)
    }

    public func scale(scaleX: Float32, scaleY: Float32, centerX: Float32, centerY: Float32): Transform {
        unsafe {
            var transform2 = this
            sfTransform_scaleWithCenter(inout transform2, scaleX, scaleY, centerX, centerY)
            return transform2
        }
    }
}
