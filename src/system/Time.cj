package cjsfml.system

@C
public struct Time {
    private let m_microseconds: Int64

    public const init() {
        m_microseconds = 0
    }

    public init(seconds!: Float32) {
        m_microseconds = Int64(seconds * 1000000.0)
    }

    public init(seconds!: Float64) {
        m_microseconds = Int64(seconds * 1000000.0)
    }

    public init(milliseconds!: Int32) {
        m_microseconds = Int64(milliseconds) * 1000
    }

    public const init(microseconds!: Int64) {
        m_microseconds = microseconds
    }

    public prop seconds: Float32 {
        get() {
            Float32(Float64(m_microseconds) / 1000000.0)
        }
    }

    public prop seconds64: Float64 {
        get() {
            Float64(m_microseconds) / 1000000.0
        }
    }

    public prop milliseconds: Int32 {
        get() {
            Int32(m_microseconds / 1000)
        }
    }

    public prop microseconds: Int64 {
        get() {
            m_microseconds
        }
    }

    public operator const func ==(right: Time): Bool {
        m_microseconds == right.m_microseconds
    }

    public operator const func !=(right: Time): Bool {
        m_microseconds != right.m_microseconds
    }

    public operator const func >(right: Time): Bool {
        m_microseconds > right.m_microseconds
    }

    public operator const func >=(right: Time): Bool {
        m_microseconds >= right.m_microseconds
    }

    public operator const func <(right: Time): Bool {
        m_microseconds < right.m_microseconds
    }

    public operator const func <=(right: Time): Bool {
        m_microseconds <= right.m_microseconds
    }

    public operator const func -(): Time {
        Time(microseconds: -m_microseconds)
    }

    public operator const func +(right: Time): Time {
        Time(microseconds: m_microseconds + right.m_microseconds)
    }

    public operator const func -(right: Time): Time {
        Time(microseconds: m_microseconds - right.m_microseconds)
    }

    public operator func *(right: Float64): Time {
        Time(seconds: (Float64(m_microseconds) / 1000000.0) * right)
    }

    public operator func *(right: Int64): Time {
        Time(microseconds: m_microseconds * right)
    }

    public operator func /(right: Float64): Time {
        Time(seconds: (Float64(m_microseconds) / 1000000.0) / right)
    }

    public operator func /(right: Int64): Time {
        Time(microseconds: m_microseconds / right)
    }

    public operator func /(right: Time): Time {
        Time(seconds: (Float64(m_microseconds) / 1000000.0) / (Float64(right.m_microseconds) / 1000000.0))
    }

    public operator func %(right: Time): Time {
        Time(microseconds: m_microseconds % right.m_microseconds)
    }

    public static const Zero = Time()
}
