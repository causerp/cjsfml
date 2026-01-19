package cjsfml.audio

import cjsfml.system.*

foreign {
    func sfSoundRecorder_isAvailable(): Bool

    func sfSoundRecorder_getAvailableDevices(count: CPointer<UIntNative>): CPointer<CString>

    func sfSoundRecorder_getDefaultDevice(): CString
}

public interface SFMLSoundRecorder <: ResourceHandle {
    func start(): Bool {
        start(44100)
    }

    func start(sampleRate: UInt32): Bool

    func stop(): Unit

    prop sampleRate: UInt32

    mut prop device: String

    mut prop channelCount: UInt32

    static prop isAvailable: Bool {
        get() {
            unsafe { sfSoundRecorder_isAvailable() }
        }
    }

    static prop availableDevices: Array<String> {
        get() {
            var deviceCount: UIntNative = 0
            let devicesPtr = unsafe { sfSoundRecorder_getAvailableDevices(inout deviceCount) }
            if (deviceCount == 0 || deviceCount > 255) {
                return []
            }
            return Array<String>(Int64(deviceCount), {
                i => unsafe { devicesPtr.read(i).toString() }
            })
        }
    }

    static prop defaultDevice: ?String {
        get() {
            let device = unsafe { sfSoundRecorder_getDefaultDevice() }
            return match (device.isNull()) {
                case false => device.toString()
                case true => None
            }
        }
    }
}
